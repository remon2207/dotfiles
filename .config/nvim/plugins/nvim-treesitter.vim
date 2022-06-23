lua <<EOF
require("nvim-treesitter.configs").setup {
    highlight = {
        enable = true
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
EOF
