require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true
    },
    autotag = {
        enable = true
    },
    indent = {
        enable = true,
        disable = { 'lua' }
    },
    ensure_installed = {
        "javascript",
        "bash",
        "css",
        "scss",
        "dockerfile",
        "lua",
        "html",
        "json",
        "jsonc",
        "markdown",
        "php",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml"
    }
}
