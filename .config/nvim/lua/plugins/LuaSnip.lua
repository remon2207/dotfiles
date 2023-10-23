local status, ls = pcall(require, 'luasnip')
if not status then
  return
end

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require('luasnip.util.events')
local ai = require('luasnip.nodes.absolute_indexer')
local extras = require('luasnip.extras')
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local conds = require('luasnip.extras.expand_conditions')
local postfix = require('luasnip.extras.postfix').postfix
local types = require('luasnip.util.types')
local parse = require('luasnip.util.parser').parse_snippet
local ms = ls.multi_snippet
local k = require('luasnip.nodes.key_indexer').new_key

local keymap = vim.keymap

keymap.set({ 'i' }, '<C-K>', function()
  ls.expand()
end, { silent = true })
keymap.set({ 'i', 's' }, '<C-L>', function()
  ls.jump(1)
end, { silent = true })
keymap.set({ 'i', 's' }, '<C-J>', function()
  ls.jump(-1)
end, { silent = true })

keymap.set({ 'i', 's' }, '<C-E>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

ls.add_snippets('typescript', {
  s(
    'try',
    fmt(
      [[
        try {{
          {1}
        }} catch(error) {{
          {2}
        }}
    ]],
      {
        i(1),
        i(2),
      }
    )
  ),
  s(
    'finally',
    fmt(
      [[
        try {{
          {1}
        }} catch(error) {{
          {2}
        }} finally {{
          {3}
        }}
    ]],
      {
        i(1),
        i(2),
        i(3),
      }
    )
  ),
})

ls.add_snippets('all', {
  s('!!!', {
    t({
      '<meta charSet="UTF-8" />',
      '<meta httpEquiv="X-UA-Compatible" content="IE=edge" />',
      '<meta name="viewport" content="width=device-width, initial-scale=1.0" />',
      '<title>{title}</title>',
    }),
  }),
  s(
    'err',
    fmt(
      [[
            console.error({1})
            ]],
      {
        i(1),
      }
    )
  ),
  s(
    'log',
    fmt(
      [[
            console.log({1})
            ]],
      {
        i(1),
      }
    )
  ),
})

ls.add_snippets('typescriptreact', {
  s('!', {
    t({
      'type Props = {',
      '  title: string',
      '}',
      '',
      'export const Header: React.FC<Props> = ({ title }) => {',
      '  return (',
      '    <>',
      '      <meta charSet="UTF-8" />',
      '      <meta httpEquiv="X-UA-Compatible" content="IE=edge" />',
      '      <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
      '      <title>{title}</title>',
      '    </>',
      '  )',
      '}',
    }),
  }),
  s(
    'reactc',
    fmt(
      [[
        export const {1}: React.FC = () => {{
          return (
            <>
              {2}
            </>
          )
        }}
    ]],
      {
        i(1),
        i(2),
      }
    )
  ),
  s(
    'nextc',
    fmt(
      [[
        import type {{ NextPage }} from 'next'

        const {1}: NextPage = () => {{
          return (
            <>
              {3}
            </>
          )
        }}

        export default {2}
    ]],
      {
        i(1),
        f(function(args)
          return args[1]
        end, ai[1]),
        i(2),
      }
    )
  ),
})

ls.add_snippets('json', {
  s('prc', {
    t({
      '{',
      '  "endOfLine": "lf",',
      '  "printWidth": 120,',
      '  "semi": false,',
      '  "singleQuote": true,',
      '  "trailingComma": "es5"',
      '}',
    }),
  }),
})
