return {
    "ThePrimeagen/harpoon",
    config = function()

        -- require("harpoon").setup({}
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        -- vim.keymap.set("n", "<leader>A", function() harpoon:list():prepend() end)
        -- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<leader>a", function() mark.add_file() end)
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

        vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
        vim.keymap.set("n", "<leader><C-h>", function() ui.replace_at(1) end)
        vim.keymap.set("n", "<leader><C-t>", function() ui.replace_at(2) end)
        vim.keymap.set("n", "<leader><C-n>", function() ui.replace_at(3) end)
        vim.keymap.set("n", "<leader><C-s>", function() ui.replace_at(4) end)
       
    end
}