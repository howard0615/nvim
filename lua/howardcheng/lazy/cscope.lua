return {

    {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
    },
    opts = {
        -- USE EMPTY FOR DEFAULT OPTIONS
        -- DEFAULTS ARE LISTED BELOW
    },
    config = function()

        -- local group = vim.api.nvim_create_augroup("CscopeBuild", { clear = true })
        -- vim.api.nvim_create_autocmd("BufWritePost", {
        -- pattern = { "*.c", "*.h" },
        -- callback = function ()
        --     vim.cmd("Cscope db build")
        -- end,
        -- group = group,
        -- })

        require("cscope_maps").setup({
                -- maps related defaults
            disable_maps = false, -- "true" disables default keymaps
            skip_input_prompt = false, -- "true" doesn't ask for input
            prefix = "<leader>c", -- prefix to trigger maps

            -- cscope related defaults
            cscope = {
                -- location of cscope db file
                db_file = "./cscope.out", -- DB or table of DBs
                                        -- NOTE:
                                        --   when table of DBs is provided -
                                        --   first DB is "primary" and others are "secondary"
                                        --   primary DB is used for build and project_rooter
                -- cscope executable
                exec = "cscope", -- "cscope" or "gtags-cscope"
                -- choose your fav picker
                picker = "quickfix", -- "quickfix", "location", "telescope", "fzf-lua", "mini-pick" or "snacks"
                -- qf_window_size = 5, -- deprecated, replaced by picket_opts below, but still supported for backward compatibility
                -- qf_window_pos = "bottom", -- deprecated, replaced by picket_opts below, but still supported for backward compatibility
                picker_opts = {
                    window_size = 5, -- any positive integer
                    window_pos = "bottom", -- "bottom", "right", "left" or "top"
                },
                -- "true" does not open picker for single result, just JUMP
                skip_picker_for_single_result = false, -- "false" or "true"
                -- custom script can be used for db build
                db_build_cmd = { script = "default", args = { "-bqkv" } },
                -- statusline indicator, default is cscope executable
                statusline_indicator = nil,
                -- try to locate db_file in parent dir(s)
                project_rooter = {
                    enable = false, -- "true" or "false"
                    -- change cwd to where db_file is located
                    change_cwd = false, -- "true" or "false"
                },
                -- cstag related defaults
                tag = {
                    enable = true, -- "true" or "false"
                    -- order of operation to run for ":Cstag"
                    order = { "cs", "tag_picker", "tag" }, -- any combination of these 3
                },
            },

            stack_view = {
                tree_hl = true, -- toggle tree highlighting
            }
            
            -- Keymaps	Description
            -- <prefix>s	find all references to the token under cursor
            -- <prefix>g	find global definition(s) of the token under cursor
            -- <prefix>c	find all calls to the function name under cursor
            -- <prefix>t	find all instances of the text under cursor
            -- <prefix>e	egrep search for the word under cursor
            -- <prefix>f	open the filename under cursor
            -- <prefix>i	find files that include the filename under cursor
            -- <prefix>d	find functions that function under cursor calls
            -- <prefix>a	find places where this symbol is assigned a value
            -- <prefix>b	build cscope database
            -- Ctrl-]	do :Cstag <cword>
            --             -- stack view defaults
            --             stack_view = {
            --                 tree_hl = true, -- toggle tree highlighting
            --             }
            

        })
        local wk = require("which-key")
        wk.add({
            "<leader>v", group = "CsStackView"
        })
        vim.keymap.set("n", "<leader>vu", function()
            local word = vim.fn.expand("<cword>")
            vim.cmd("CsStackView open up " .. word)
        end, { noremap = true, silent = true , desc="CsStackView open up <cursor_word>"})
        vim.keymap.set("n", "<leader>vo", function()
            local word = vim.fn.expand("<cword>")
            vim.cmd("CsStackView open down " .. word)
        end, { noremap = true, silent = true , desc="CsStackView open up <cursor_word>"})
        vim.keymap.set("n", "<leader>vt", "<cmd>CsStackView toggle<CR>", {desc = "CsStackView toggle"})
    end
    },
    {
    "ludovicchabant/vim-gutentags",
    init = function()
        vim.g.gutentags_modules = {"cscope_maps"} -- This is required. Other config is optional
        vim.g.gutentags_cscope_build_inverted_index_maps = 1
        vim.g.gutentags_cache_dir = vim.fn.expand("~/code/.gutentags")
        -- vim.g.gutentags_file_list_command = "fd -e c -e h"
        -- vim.g.gutentags_trace = 1
    end,
    }
}