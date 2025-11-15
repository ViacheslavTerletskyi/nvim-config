return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        config = function()
            local telescope = require('telescope')
            telescope.setup {
                pickers = {
                    find_files = {
                        theme = "ivy",
                    },
                    help_tags = {
                        theme = "ivy",
                    },
                },
                extensions = {
                    fzf = {}
                },
            }
            telescope.load_extension("fzf")

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>hf', builtin.help_tags)
            vim.keymap.set('n', '<leader>pf', builtin.find_files)

            vim.keymap.set('n', '<leader>dd', function()
                builtin.diagnostics({ severity_bound = "ERROR" })
            end)

            vim.keymap.set('n', '<leader>pw', function()
                builtin.grep_string({ search = vim.fn.expand("<cword>") })
            end)

            require "config.telescope.multigrep".setup()
        end
    },
}
