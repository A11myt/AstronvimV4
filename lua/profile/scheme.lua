return {

    "sainnhe/sonokai",
    init = function() -- init function runs before the plugin is loaded
      vim.g.sonokai_style = "shusia"
      vim.g.sonokai_transparent_background = 2
    end,
    "rmehri01/onenord.nvim",
    init = function()
      require('onenord').setup({
        disable = {
          background = true,
          borders = true,
        },
      })
    end,
    "bluz71/vim-nightfly-colors",
    init = function()
      vim.g.nightflyCursorColor = 1
    end,
    "overcache/NeoSolarized",
    init = function()
      vim.g.neosolarized_style = "dark"
    end,
    "catppuccin/nvim",
    init = function()
      require("catppuccin").setup({
        flavor = "mocha",
        transparent_background = true,
      })
    end
  }
  -- "nordtheme/vim",

  -- opts = {
  --   -- your custom config
  --   highlights = {
  --     -- Uncomment and modify the color overrides you want to use
  --     -- duskfox = { -- a table of overrides/changes to the default
  --     --   Normal = { bg = "#000000" },
  --     -- },
  --     onenord = {   -- a table of overrides/changes to the default
  --       Normal = { fg = "#FeCC98" },
  --     },
  --   },
  -- Uncomment and modify the default_theme function if you want to use it
  -- default_theme = function(highlights) -- or a function that returns a new table of colors to set
  --   local C = require "default_theme.colors"
  --   highlights.Normal = { fg = C.fg, bg = C.bg }
  --   return highlights
  -- end,


