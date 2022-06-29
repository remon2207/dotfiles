local status, github_theme = pcall(require, 'github-theme')

if (not status) then return end

github_theme.setup {
    comment_style = 'NONE',
    keyword_style = 'NONE'
}
