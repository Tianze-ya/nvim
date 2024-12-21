local m = { noremap = true, nowait = true }

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            "nvim-tree/nvim-web-devicons",
            'stevearc/dressing.nvim',
            {
                "LukasPietzschmann/telescope-tabs",
                config = function()
                    local tstabs = require('telescope-tabs')
                    tstabs.setup({})
                    vim.keymap.set('n', '<c-t>', tstabs.list_tabs, {})
                end
            },
        },
        config = function()
            local builtin = require("telescope.builtin")

            -- keymap
            vim.keymap.set('n', '<c-p>', builtin.find_files, m)
            vim.keymap.set('n', '<leader>rs', builtin.resume, m)
            vim.keymap.set('n', '<c-w>', builtin.buffers, m)
            vim.keymap.set('n', '<c-_>', builtin.current_buffer_fuzzy_find, m)
            vim.keymap.set('n', 'gi', builtin.git_status, m)
            vim.keymap.set("n", ";", builtin.commands, m)

            vim.lsp.protocol.DiagnosticSeverity = {
                "Error",
                "Warning",
                "Information",
                "Hint",
                Error = 1,
                Warning = 2,
                Information = 3,
                Hint = 4
            }
            vim.diagnostic.severity = {
                "ERROR",
                "WARN",
                "INFO",
                "HINT",
                E = 1,
                ERROR = 1,
                W = 2,
                WARN = 2,
                I = 3,
                INFO = 3,
                N = 4,
                HINT = 4
            }

            local ts = require('telescope')
            local actions = require('telescope.actions')

            ts.setup({
                defaults = {
                    file_ignore_patterns = {
                        "node_modules",
                        "build",
                        "dist",
                    },
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--fixed-strings",
                        "--smart-case",
                        "--trim",
                    },
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                    },
                    mappings = {
                        i = {
                            ["<C-h>"] = "which_key",
                            ["<C-k>"] = "move_selection_previous",
                            ["<C-j>"] = "move_selection_next",
                            ["<C-l>"] = "preview_scrolling_up",
                            ["<C-y>"] = "preview_scrolling_down",
                            ["<esc>"] = "close",
                            ["<C-n>"] = require('telescope.actions').cycle_history_next,
                            ["<C-p>"] = require('telescope.actions').cycle_history_prev,
                        }
                    },
                    color_devicons = true,
                    --prompt_prefix = "🔍 ",
                    --selection_caret = " ",
                    path_display = { "truncate" },
                    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                },
                pickers = {
                    buffers = {
                        show_all_buffers = true,
                        sort_lastused = true,
                        mappings = {
                            i = {
                                ["<c-d>"] = actions.delete_buffer,
                            },
                        }
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    command_palette = command_palette,
                }
            })
            require('dressing').setup({
                select = {
                    get_config = function(opts)
                        if opts.kind == 'codeaction' then
                            return {
                                backend = 'telescope',
                                telescope = require('telescope.themes').get_cursor()
                            }
                        end
                    end
                }
            })

            ts.load_extension('neoclip')
            ts.load_extension('telescope-tabs')
            ts.load_extension('fzf')
            --ts.load_extension('dap')
        end
    },
    {
        "FeiyouG/commander.nvim",
        config = function()
            local commander = require("commander")
            commander.setup({
                telescope = {
                    enable = true,
                },
            })
            vim.keymap.set('n', '<c-q>', require("commander").show, m)
            commander.add({
                {
                    desc = "Run Simulator",
                    cmd = "<CMD>Telescope simulators run<CR>",
                },
                {
                    desc = "Git diff",
                    cmd = "<CMD>Telescope git_status<CR>",
                },
            })
        end
    }
    
}