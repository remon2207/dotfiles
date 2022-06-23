nnoremap <Left> <Nop>
nnoremap <Down> <Nop>
nnoremap <Up> <Nop>
nnoremap <Right> <Nop>
" nnoremap <Down> gj
" nnoremap <Up> gk

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
" インサートモードでファイル更新
inoremap <silent> <C-s> <Esc>:<C-u>update<CR>
" 行が折り返しされていたら表示行単位で移動
nnoremap j gj
nnoremap k gk

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  nnoremap <silent> <C-t> :<C-u>terminal<CR>
  nnoremap <silent> ss :<C-u>sp<CR><C-w>w
  nnoremap <silent> sv :<C-u>vs<CR><C-w>w
endif

" window
nnoremap sh <C-w>h
nnoremap sH <C-w>H
nnoremap sj <C-w>j
nnoremap sJ <C-w>J
nnoremap sk <C-w>k
nnoremap sK <C-w>K
nnoremap sl <C-w>l
nnoremap sL <C-w>L

" tab
nnoremap <silent> tn :<C-u>tabnew<CR>
nnoremap tl gt
nnoremap th gT

" buffer
nnoremap <silent> fh :<C-u>bprev<CR>
nnoremap <silent> fl :<C-u>bnext<CR>

" cursor
inoremap <C-d> <Del>
