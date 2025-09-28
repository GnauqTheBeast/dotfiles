vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "white" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#ead84e" })
  end,
})

return {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 999,
    config = function()
      local themes = {
        "darcula-dark",
        "tokyonight",
        "accent",
        "catppuccin",
        "rose-pine",
      }
      local current_theme_index = 1
      vim.cmd.colorscheme(themes[current_theme_index])
      vim.keymap.set("n", "<leader>nt", function()
        current_theme_index = current_theme_index + 1
        if current_theme_index > #themes then
          current_theme_index = 1
        end
        local theme = themes[current_theme_index]
        vim.cmd.colorscheme(theme)
        print("Changed nvim theme to: " .. theme)
      end, { noremap = true, silent = true })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 800,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
  },
  {
    "alligator/accent.vim",
    name = "accent",
    priority = 1100,
  },
  {
    "xiantang/darcula-dark.nvim",
    name = "darcula-dark",
    priority = 1200,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("darcula").setup({})
    end,
  },
}
