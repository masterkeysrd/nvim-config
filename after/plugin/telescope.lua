local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim",
            '--hidden',
            '--no-ignore',
            '--glob',
            '!**/.git/*'
        },
    },
    pickers = {
        find_files = {
            find_command = {
                'rg',
                '--files',
                '--hidden',
                '--no-ignore',
                '--glob',
                '!**/.git/*'
            }
        }
    }
})

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

