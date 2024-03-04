local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    enabled = true,
    config = function(_, opts)
      require("harpoon").setup(opts)
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

      vim.keymap.set("n", "<C-m>", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<C-b>", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<C-g>", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<C-t>", function() ui.nav_file(4) end)
      vim.keymap.set("n", "<C-y>", function() ui.nav_file(5) end)
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },

  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end
  },

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "js-debug-adapter",
        "prettierd",
        "tailwindcss-language-server",
        "typescript-language-server",
        "intelephense",
        "phpcbf",
        "html-lsp",
        "css-lsp",
        "bash-language-server"
      }
    }
  },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "bash",
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "tsx",
        "c",
        "cpp",
        "lua",
        "php",
        "python",
        "go",
        "markdown",
        "markdown_inline",
        "vim",
        "vimdoc",
        "query",
        "regex",
        "java",
        "jq",
        "dockerfile",
        "bash",
        "ruby",
        "yaml",
      }
      return opts
    end,
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings("dap")
    end
  },

  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return require "custom.configs.null-ls"
  --   end,
  -- },

  {
    "barrett-ruth/live-server.nvim",
    -- build = 'pnpm add -g live-server',
    -- cmd = { 'LiveServerStart', 'LiveServerStop' },
    config = function()
      require("live-server").setup({
        -- args = { "--port=6661", "--browser=firefox" },
        args = { '--port=6661', '--browser=google-chrome-stable' }
        -- args = { "--port=6661", "--browser=microsoft-edge" },
      })

      vim.keymap.set("n", "<F10>", "<cmd>LiveServerStart<cr>")
      vim.keymap.set("n", "<F11>", "<cmd>LiveServerStop<cr>")
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      -- Default browser setting in 'autocmds'
      vim.keymap.set("n", "<F5>", "<cmd>MarkdownPreviewToggle<cr>")
    end,
  },

  { "KabbAmine/vCoolor.vim", lazy = false },

  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers", -- Type this manually in case failed installing when launch nvim
    lazy = false,                  -- specify lazy = false because some lazy.nvim distributions set lazy = true by default
    -- tag = "*",
    -- dependencies = { "nvim-lua/plenary.nvim" },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-neorg/neorg-telescope" },
    },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {
            config = {
              folds = false,
              icon_preset = "diamond",
              --[[ Example to configure ]]
              -- icons = {
              -- 	todo = {
              -- 		uncertain = {
              -- 			icon = "",
              -- 		},
              -- 	},
              -- }, ----------------------
            },
          },                  -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/Documents/notes",
                neorg = "~/Documents/neorg",
              },
              default_workspace = "notes",
            },
          },
          ["core.summary"] = {
            config = {
              strategy = "default", -- Read the metadata to categorize and annotate files
              -- strategy = "by_path" -- Similar to "default" but uses the capitalized name of the folder containing a *.norg file as category.
            },
          },                                    -- Loads summary module
          -- ["core.ui.calendar"] = {}, -- Loads calendar module (require neovim 0.10.x)
          ["core.integrations.telescope"] = {}, -- Load telescope neorg integrations

          -- Loads reesitter and export module
          ["core.integrations.treesitter"] = {},
          ["core.highlights"] = {},
          ["core.mode"] = {},
          ["core.export"] = {},
        },
      })
      local neorg_callbacks = require("neorg.core.callbacks")

      neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
        -- Map all the below keybinds only when the "norg" mode is active
        keybinds.map_event_to_mode("norg", {
          n = { -- Bind keys in normal mode
            { "<localleader>fl", "core.integrations.telescope.find_linkable" },
            { "<localleader>il", "core.integrations.telescope.insert_link" },
          },

          i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
          },
        }, {
          silent = true,
          noremap = true,
        })
      end)
    end,
    keys = {
      { "<localleader>ww", "<cmd>Neorg index<cr>",            desc = "Open neorg index based on current workspace" },
      { "<localleader>q",  "<cmd>Neorg return<cr>",           desc = "Remove all .norg buffer" },
      { "<localleader>tt", "<cmd>Neorg toggle-concealer<cr>", desc = "Toggle concealer" },
      { "<localleader>to", "<cmd>Neorg toc<cr>",              desc = "Open table of contents" },
      { "<localleader>wo", ":Neorg workspace ",               desc = "Open norg workspace" },
      -- Run: `:nmap <localleader>` to see more!.
    },
  }
}
return plugins
