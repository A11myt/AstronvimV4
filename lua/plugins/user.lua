--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

---@type LazySpec
local config = {
  -- mappings = require "./profile.keybinds",
  -- colorScheme = require "./profile.scheme",
  -- options = require "./profile.settings",
  -- plugins = require "profile.plugins",
  -- lsp = require "user.lsp",

  --Options
  options = {
    opt = {
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
  --colorSchemes
  "sainnhe/sonokai",
  init = function() -- init function runs before the plugin is loaded
    vim.g.sonokai_style = "shusia"
    vim.g.sonokai_transparent_background = 2
  end,
  "rmehri01/onenord.nvim",
  init = function()
    require("onenord").setup {
      disable = {
        background = true,
        borders = true,
      },
    }
  end,
  "bluz71/vim-nightfly-colors",
  init = function() vim.g.nightflyCursorColor = 1 end,
  "overcache/NeoSolarized",
  init = function() vim.g.neosolarized_style = "dark" end,
  "catppuccin/nvim",
  init = function()
    require("catppuccin").setup {
      flavor = "mocha",
      transparent_background = true,
    }
  end,

  --KeyMappings
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>wl"] = { "<cmd>vsplit<cr>", desc = "Split window vertically" },
    ["<leader>wo"] = { "<c-w>o", desc = "Maximize window" },

    ["<leader>fk"] = { "<cmd>Telescope keymaps<cr>", desc = "Find keymapgs" },
    ["<C-e>"] = { "<cmd>Telescope oldfiles<cr>", desc = "Find recent files" },
    ["<leader>xx"] = { '<cmd>lua vim.notify("haha")<cr>', desc = "Test lua mapping" },
    ["<M-n>"] = { '<cmd>lua vim.notify("heihei")<cr>', desc = "Test lua mapping" },
  },
  i = {
    [";;"] = { ":=" },
    [";a"] = { "!=" },
  },
  v = {},
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },

  --plugins
  init = {
    -- You can disable default plugins as follows:
    ["goolord/alpha-nvim"] = { disable = true },

    ["neo-tree"] = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    },
    -- ["NERDTree"] = { ShowHidden = 1 },
    -- You can also add new plugins here as well:
    -- Add plugins, the packer syntax without the "use"
    -- { "andweeb/presence.nvim" },
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },

    -- We also support a key value style plugin definition similar to NvChad:
    -- ["ray-x/lsp_signature.nvim"] = {
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
  },
  -- All other entries override the require("<key>").setup({...}) call for default plugins
  ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
    -- config variable is the default configuration table for the setup functino call
    local null_ls = require "null-ls"
    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
    }
    -- set up null-ls's on_attach function
    -- NOTE: You can remove this on attach function to disable format on save
    -- config.on_attach = function(client)
    --   if client.resolved_capabilities.document_formatting then
    --     vim.api.nvim_create_autocmd("BufWritePre", {
    --       desc = "Auto format before save",
    --       pattern = "<buffer>",
    --       callback = vim.lsp.buf.formatting_sync,
    --     })
    --   end
    -- end
    -- return config -- return final config table to use in require("null-ls").setup(config)
  end,
  -- treesitter = { -- overrides `require("treesitter").setup(...)`
  --   ensure_installed = { "lua" },
  -- },
  -- -- use mason-lspconfig to configure LSP installations
  -- ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
  --   ensure_installed = { "sumneko_lua" },
  -- },
  -- use mason-tool-installer to configure DAP/Formatters/Linter installation
  --
  "Jellydn/CopilotChat.nvim",
  opts = {
    mode = "split",
    prompts = {
      Explain = "Explain how it works.",
      Review = "Review the following code and provide concise suggestions.",
      Tests = "Briefly explain how the selected code works, then generate unit tests.",
      Refactor = "Refactor the code to improve clarity and readability.",
    },
  },
  build = function()
    vim.defer_fn(function()
      vim.cmd "UpdateRemotePlugins"
      vim.notify "CopilotChat - Updated remote plugins. Please restart Neovim."
    end, 3000)
  end,
  event = "VeryLazy",
  keys = {
    { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
    { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
    { "<leader>ccr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
    { "<leader>ccR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
  },
  --
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options

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

  --
  ["mason-tool-installer"] = { -- overrides `require("mason-tool-installer").setup(...)`
    ensure_installed = { "prettier", "stylua" },
  },
  packer = { -- overrides `require("packer").setup(...)`
    compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
  },

  {
    "lukas-reineke/virt-column.nvim",
    init = function()
      require("virt-column").setup {
        char = "║",
      }
    end,
  },
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    event = "InsertEnter",
    as = "hop",
    config = [[require('user.hop')]],
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "json", "html", "markdown", "typescript", "javascript", "css" },
      auto_install = true,
    },
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
        "     █████  ███████ ████████ ██████   ██████  ",
        "    ██   ██ ██         ██    ██   ██ ██    ██ ",
        "    ███████ ███████    ██    ██████  ██    ██ ",
        "    ██   ██      ██    ██    ██   ██ ██    ██ ",
        "    ██   ██ ███████    ██    ██   ██  ██████  ",
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
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function(plugin, opts)
      require("copilot").setup {
        suggestion = {
          auto_trigger = true,
          accept = "<fn-l>",
          accept_word = false,
          accept_line = false,
          next = "<fn-]>",
          prev = "<fn-[>",
          dismiss = "<C-]>",
        },
      }
    end,
  },

  polish = function()
    local copilot_options = { silent = true, expr = true, script = true }
    vim.api.nvim_set_keymap("i", "<C-l>", "copilot#Accept(<Tab>)", copilot_options)
  end,
}
return config
