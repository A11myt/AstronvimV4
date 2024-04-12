local scheme = {
  -- Uncomment the color schemes you want to use
  -- "sainnhe/sonokai",
  -- "rmehri01/onenord.nvim",
  -- "bluz71/vim-nightfly-colors",
  "nordtheme/vim",

  opts = {
    -- your custom config
    highlights = {
      -- Uncomment and modify the color overrides you want to use
      -- duskfox = { -- a table of overrides/changes to the default
      --   Normal = { bg = "#000000" },
      -- },
      onenord = {   -- a table of overrides/changes to the default
        Normal = { fg = "#FeCC98" },
      },
    },
    -- Uncomment and modify the default_theme function if you want to use it
    -- default_theme = function(highlights) -- or a function that returns a new table of colors to set
    --   local C = require "default_theme.colors"
    --   highlights.Normal = { fg = C.fg, bg = C.bg }
    --   return highlights
    -- end,
  }
}

return scheme