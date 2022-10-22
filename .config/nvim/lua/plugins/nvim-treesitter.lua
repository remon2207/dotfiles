local status, t = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

t.setup({
    highlight = {
        enable = true,
    },
    -- autotag = {
    --     enable = true,
    -- },
    indent = {
        enable = true,
        disable = {}
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
        "yaml",
        "gitignore",
        "sql",
        "graphql",
        "prisma",
    },
})
