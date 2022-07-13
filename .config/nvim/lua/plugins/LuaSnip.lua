local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l
local postfix = require("luasnip.extras.postfix").postfix

local set = vim.keymap.set

-- set('i', '<Tab>', 'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"', { silent = true, expr = true, noremap = false })
set('i', '<Tab>', 'luasnip#expandable() ? "<Plug>luasnip-expand-snippet" : "<Tab>"', { silent = true, expr = true, noremap = false })
set('i', '<C-b>', '<Cmd>lua require("luasnip").jump(-1)<CR>', { noremap = true, silent = true })
set('i', '<C-f>', '<Cmd>lua require("luasnip").jump(1)<CR>', { noremap = true, silent = true })
set('s', '<C-b>', '<Cmd>lua require("luasnip").jump(-1)<CR>', { noremap = true, silent = true })
set('s', '<C-f>', '<Cmd>lua require("luasnip").jump(1)<CR>', { noremap = true, silent = true })
set('i', '<C-E>', 'luasnip#choice_active() ? "<Plug>(luasnip-next-choice)" : "<C-E>"', { silent = true, expr = true, noremap = false })
set('s', '<C-E>', 'luasnip#choice_active() ? "<Plug>(luasnip-next-choice)": "<C-E>"', { silent = true, expr = true, noremap = false })

ls.add_snippets('typescript', {
    s('try', fmt([[
        try {{
          {1}
        }} catch(e) {{
          {2}
        }}
    ]],
        {
            i(1),
            i(2)
        }
    )),
    s('finally', fmt([[
        try {{
          {1}
        }} catch(e) {{
          {2}
        }} finally {{
          {3}
        }}
    ]],
        {
            i(1),
            i(2),
            i(3)
        }
    ))
})

ls.add_snippets('all', {
    s('!!!', {
        t({
            '<meta charSet="UTF-8" />',
            '<meta httpEquiv="X-UA-Compatible" content="IE=edge" />',
            '<meta name="viewport" content="width=device-width, initial-scale=1.0" />',
            '<title>{title}</title>'
        })
    }),
})

ls.add_snippets('typescriptreact', {
    s('!', {
        t({
            'type Props = {',
            '  title: string;',
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
            '  );',
            '};',
        })
    }),
    s('reactc', fmt([[
        export const {1}: React.FC = () => {{
          return (
            <>
              {2}
            </>
          );
        }};
    ]],
        {
            i(1),
            i(2)
        }
    )),
    s('nextc', fmt([[
        import type {{ NextPage }} from 'next';

        const {1}: NextPage = () => {{
          return (
            <>
              {3}
            </>
          );
        }};

        export default {2};
    ]],
        {
            i(1),
            f(function(args) return args[1] end, ai[1]),
            i(2),
        }
    )),
        s('nextc', fmt([[
        import fdsafdsfasdf afda fdtype {{ NextPage }} from 'next';

        const {1}: NextPage = () => {{
          return (
            <>
              {3}
            </>
          );
        }};

        export default {2};
    ]],
        {
            i(1),
            f(function(args) return args[1] end, ai[1]),
            i(2),
        }
    ))

})
