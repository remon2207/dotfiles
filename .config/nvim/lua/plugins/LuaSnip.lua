local status, ls = pcall(require, 'luasnip')
if not status then
  return
end

local keymap = vim.keymap
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local sn = ls.snippet_node
local d = ls.dynamic_node

keymap.set({ 'i' }, '<C-K>', function()
  ls.expand()
end, { silent = true })
keymap.set({ 'i', 's' }, '<C-f>', function()
  ls.jump(1)
end, { silent = true })
keymap.set({ 'i', 's' }, '<C-b>', function()
  ls.jump(-1)
end, { silent = true })
keymap.set({ 'i', 's' }, '<C-E>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

ls.add_snippets('javascript', {
  s('try', {
    t({ 'try {' }),
    t({ '', '  ' }),
    i(1),
    t({ '', '} catch (error) {' }),
    t({ '', '  ' }),
    i(0),
    t({ '', '}' }),
  }),
  s('finally', {
    t({ 'try {' }),
    t({ '', '  ' }),
    i(1),
    t({ '', '} catch (error) {' }),
    t({ '', '  ' }),
    i(2),
    t({ '', '} finally {' }),
    t({ '', '  ' }),
    i(0),
    t({ '', '}' }),
  }),
  s('log', {
    t({ 'console.log(' }),
    i(0),
    t({ ')' }),
  }),
  s('error', {
    t({ 'console.error(' }),
    i(0),
    t({ ')' }),
  }),
})
ls.add_snippets('typescript', {
  s('try', {
    t({ 'try {' }),
    t({ '', '  ' }),
    i(1),
    t({ '', '} catch (error) {' }),
    t({ '', '  ' }),
    i(0),
    t({ '', '}' }),
  }),
  s('finally', {
    t({ 'try {' }),
    t({ '', '  ' }),
    i(1),
    t({ '', '} catch (error) {' }),
    t({ '', '  ' }),
    i(2),
    t({ '', '} finally {' }),
    t({ '', '  ' }),
    i(0),
    t({ '', '}' }),
  }),
  s('log', {
    t({ 'console.log(' }),
    i(0),
    t({ ')' }),
  }),
  s('error', {
    t({ 'console.error(' }),
    i(0),
    t({ ')' }),
  }),
})

ls.add_snippets('javascriptreact', {
  s('reactc', {
    t({ 'export const ' }),
    i(1),
    t({ ': React.FC = () => {' }),
    t({ '', '  return (' }),
    t({ '', '    <>' }),
    t({ '', '      ' }),
    i(0),
    t({ '', '    </>' }),
    t({ '', '  )' }),
    t({ '', '}' }),
  }),
  s('nextc', {
    t({ "import type { NextPage } from 'next'" }),
    t({ '', '' }),
    t({ '', '' }),
    t({ 'const ' }),
    i(1),
    t({ ': NextPage = () => {' }),
    t({ '', '  return (' }),
    t({ '', '    <>' }),
    t({ '', '      ' }),
    i(0),
    t({ '', '    </>' }),
    t({ '', '  )' }),
    t({ '', '}' }),
    t({ '', '' }),
    t('export default '),
    d(2, function(args)
      return sn(nil, {
        i(1, args[1]),
      })
    end, { 1 }),
  }),
  s('log', {
    t({ 'console.log(' }),
    i(0),
    t({ ')' }),
  }),
  s('error', {
    t({ 'console.error(' }),
    i(0),
    t({ ')' }),
  }),
})

ls.add_snippets('typescriptreact', {
  s('reactc', {
    t({ 'export const ' }),
    i(1),
    t({ ': React.FC = () => {' }),
    t({ '', '  return (' }),
    t({ '', '    <>' }),
    t({ '', '      ' }),
    i(0),
    t({ '', '    </>' }),
    t({ '', '  )' }),
    t({ '', '}' }),
  }),
  s('nextc', {
    t({ "import type { NextPage } from 'next'" }),
    t({ '', '' }),
    t({ '', '' }),
    t({ 'const ' }),
    i(1),
    t({ ': NextPage = () => {' }),
    t({ '', '  return (' }),
    t({ '', '    <>' }),
    t({ '', '      ' }),
    i(0),
    t({ '', '    </>' }),
    t({ '', '  )' }),
    t({ '', '}' }),
    t({ '', '' }),
    t('export default '),
    d(2, function(args)
      return sn(nil, {
        i(1, args[1]),
      })
    end, { 1 }),
  }),
  s('log', {
    t({ 'console.log(' }),
    i(0),
    t({ ')' }),
  }),
  s('error', {
    t({ 'console.error(' }),
    i(0),
    t({ ')' }),
  }),
  s('state', {
    t({ 'const [' }),
    i(1, 'state'),
    t({ ', set' }),
    i(2, 'State'),
    t({ '] = useState(' }),
    i(0, 'initialState'),
    t({ ')' }),
  }),
  s('effect', {
    t({ 'useEffect(() => {' }),
    t({ '', '  ' }),
    i(0),
    t({ '', '}, [])' }),
  }),
})

ls.add_snippets('lua', {
  s('fn', {
    t({ 'local function ' }),
    i(1),
    t({ '()' }),
    t({ '', '  ' }),
    i(0),
    t({ '', 'end' }),
  }),
})

ls.add_snippets('fish', {
  s('fn', {
    t({ 'function ' }),
    i(1),
    t({ '', '  ' }),
    i(0),
    t({ '', 'end' }),
  }),
  s('if', {
    t({ 'if ' }),
    i(1),
    t({ '', '  ' }),
    i(0),
    t({ '', 'end' }),
  }),
})

ls.add_snippets('json', {
  s('prc', {
    t({ '{' }),
    t({ '', '  "endOfLine": "lf",' }),
    t({ '', '  "printWidth": 120,' }),
    t({ '', '  "semi": false,' }),
    t({ '', '  "singleQuote": true,' }),
    t({ '', '  "trailingComma": "es5"' }),
    t({ '', '}' }),
  }),
})
