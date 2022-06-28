require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true
    },
    autotag = {
        enable = true
    },
    ensure_installed = {
        "javascript",
        "bash",
        "css",
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