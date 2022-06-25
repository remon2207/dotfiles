call ddc#custom#patch_global('sources', [
      \ 'vim-lsp',
      \ 'around',
      \ 'file',
      \ ])

call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
    \   'matchers': ['matcher_head'],
    \   'sorters': ['sorter_rank'],
    \   'minAutoCompleteLength': 1,
      \ 'forceCompletionPattern': '\.\w*|:\w*|->\w*|\$\w*'
    \ },
    \ 'vim-lsp': {
      \ 'mark': 'LSP'
      \ },
    \ 'around': {
    \   'mark': 'A'
    \ },
    \ 'file': {
      \ 'mark': 'F',
      \ 'isVolatile': v:true,
      \ 'forceCompletionPattern': '\S/\S*'
      \ },
      \ 'skkeleton': {
        \ 'mark': 'skkeleton',
        \ 'matchers': ['skkeleton'],
        \ 'sorters': [],
        \ }
    \ })

call ddc#custom#patch_global('sourceParams', {
      \ 'around': {
        \ 'maxSize': 500
        \ }
        \ })

call ddc#enable()
