local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

vim.cmd[[
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
" imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" imap <silent><expr> <Tab> luasnip#expand_or_jumpable()
" imap <silent><expr> <Tab> luasnip#expandable()
" imap <silent><expr> <Tab> luasnip#expand()
" -1 for jumping backwards.
" inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
"
" snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
" snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

inoremap <silent> <C-b> <Cmd>lua require('luasnip').jump(-1)<CR>
inoremap <silent> <C-f> <Cmd>lua require('luasnip').jump(1)<CR>

snoremap <silent> <C-b> <Cmd>lua require('luasnip').jump(-1)<CR>
snoremap <silent> <C-f> <Cmd>lua require('luasnip').jump(1)<CR>


" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]]

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
    s('!', {
        t({
            '<meta charSet="UTF-8" />',
            '<meta httpEquiv="X-UA-Compatible" content="IE=edge" />',
            '<meta name="viewport" content="width=device-width, initial-scale=1.0" />',
            '<title>{title}</title>'
        })
    }),
    s('component', fmt([[
        type Props = {{
          title: string;
        }};

        export const {1}: React.FC<Props> = ({{ title }}) => {{
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
    s('next', fmt([[
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
            i(2),
            i(3)
        }
    )),
})
