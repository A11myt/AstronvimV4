--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below
local config = {
  colorscheme = "onenord",
  highlights = {
    -- duskfox = { -- a table of overrides/changes to the default
    --   Normal = { bg = "#000000" },
    -- },
    onenord = { -- a table of overrides/changes to the default
      Normal = { fg = "#FeCC98" },
    },
    -- default_theme = function(highlights) -- or a function that returns a new table of colors to set
    --   local C = require "default_theme.colors"
    --   highlights.Normal = { fg = C.fg, bg = C.bg }
    --   return highlights
    -- end,
  },
  options = {
    opt ={
  relativenumber = true,
      textwidth = 80,
      colorcolumn = "80",
    },
    g = {
    copilot_no_tab_map = true,
    opilot_assume_mapped = true,
    copilot_tab_fallback = "",
    },
  },
  -- mappings = require "./profile.keybinds",
  -- Configure plugins
  plugins = require "profile.plugins",
  -- lsp = require "user.lsp",
  


  polish = function()
   local copilot_options = { silent = true, expr = true, script = true }
   vim.api.nvim_set_keymap("i", "<C-l>", "copilot#Accept(<Tab>)", copilot_options)
  end,
}
return config

