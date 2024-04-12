--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below
local config = {
  mappings = require "./profile.keybinds",
  colorScheme = require "./profile.scheme",
  options = require "./profile.settings",
  plugins = require "profile.plugins",
  -- lsp = require "user.lsp",

  polish = function()
   local copilot_options = { silent = true, expr = true, script = true }
   vim.api.nvim_set_keymap("i", "<C-l>", "copilot#Accept(<Tab>)", copilot_options)
  end,
}
return config

