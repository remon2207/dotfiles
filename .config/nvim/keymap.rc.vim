"  ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
" 行頭へ移動
cnoremap <C-a> <Home>
inoremap <C-a> <Home>
" 行末へ移動
cnoremap <C-e> <End>
inoremap <C-e> <End>
" Exコマンドを実装する関数を定義
function! ExecExCommand(cmd)
  silent exec a:cmd
  return ''
endfunction
inoremap <silent> <expr> <C-p> "<C-r>=ExecExCommand('normal k')<CR>"
inoremap <silent> <expr> <C-n> "<C-r>=ExecExCommand('normal j')<CR>"
" 補完せず補完ウィンドウを閉じてから移動
inoremap <silent> <expr> <C-b> pumvisible() ? "<C-e><C-r>=ExecExCommand('normal b')<CR>" : "<C-r>=ExecExCommand('normal b')<CR>"
inoremap <silent> <expr> <C-f> pumvisible() ? "<C-e><C-r>=ExecExCommand('normal w')<CR>" : "<C-r>=ExecExCommand('normal w')<CR>"
inoremap <silent> <expr> <C-l> "<C-r>=ExecExCommand('update')<CR>"
" プラグインによってはこちらのほうが相性がいいかも:
inoremap <C-l> <ESC>:update<CR>a

inoremap <silent> jj <ESC>
inoremap <silent> っj <ESC>

nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk


nnoremap <c-t> :terminal<CR>
nnoremap <space>t :tabedit<CR>
nnoremap <space>tn :tabnext<CR>
nnoremap <space>tp :tabprevious<CR>
nnoremap sp :split<CR>
nnoremap vp :vsplit<CR>

