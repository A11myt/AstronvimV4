--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

---@type LazySpec
local config = {
  --Options
  --plugins
  -- All other entries override the require("<key>").setup({...}) call for default plugins
  --
  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.val = {
        "   █████    ██   ██  ███    ███ ██    ██ ████████",
        "  ██   ██ ████ ████  ████  ████  ██  ██     ██   ",
        "  ███████   ██   ██  ██ ████ ██   ████      ██   ",
        "  ██   ██   ██   ██  ██  ██  ██    ██       ██   ",
        "  ██   ██   ██   ██  ██      ██    ██       ██   ",
        "",
        "        ███    ██ ██    ██ ██ ███    ███",
        "        ████   ██ ██    ██ ██ ████  ████",
        "        ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "        ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "        ██   ████   ████   ██ ██      ██",
        "",
      }
    end,
  },

  polish = function()
    local copilot_options = { silent = true, expr = true, script = true }
    vim.api.nvim_set_keymap("i", "<C-l>", "copilot#Accept(<Tab>)", copilot_options)
  end,
}
return config
