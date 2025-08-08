return {
  "lambdalisue/suda.vim",
  event = "VeryLazy",
  config = function()
    -- Enable suda.vim to read files with sudo when needed
    vim.g.suda_smart_edit = 1

    -- Optional: Set custom commands
    vim.api.nvim_create_user_command("SudoWrite", "SudaWrite", {})
    vim.api.nvim_create_user_command("SudoRead", "SudaRead", {})

    -- Optional: Add keymaps
    vim.keymap.set("n", "<leader>sw", "<cmd>SudaWrite<cr>", { desc = "Sudo Write" })
    vim.keymap.set("n", "<leader>sr", "<cmd>SudaRead<cr>", { desc = "Sudo Read" })
  end,
}
