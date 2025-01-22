
return {
    "mbbill/undotree",

    tag = "rel_5.0",

    config = function() 
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
}