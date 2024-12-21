-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        require("config.plugins.notify"),
        require("config.plugins.fzf"),
        require("config.plugins.neoclip"),
        require("config.plugins.telescope"),
        require("config.plugins.tex"),
        require("config.plugins.wilder"),
        require("config.plugins.dropbar"),
        require("config.plugins.lualine"),
        require("config.plugins.fun"),
        require("config.plugins.theme"),
        { "dstein64/vim-startuptime" },
    },
    checker = { enabled = true },
})
