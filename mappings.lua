local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger"
    }
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>n"] = { "<cmd>NvimTreeToggle<CR>", "Toggle nvimtree" },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<S-l>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

-- Your custom mappings
M.abc = {
  n = {
    ["<leader>i"] = { [[:lua vim.o.ignorecase = not vim.o.ignorecase if vim.o.ignorecase then print("Ignorecase") else print("No ignorecase") end<cr>]], " ", opts = { nowait = true, silent = true } },
    ["<leader>hh"] = { [[:lua vim.o.hlsearch = not vim.o.hlsearch if vim.o.hlsearch then print("Hlsearch") else print("No hlsearch") end<cr>]], " ", opts = { nowait = true, silent = true } },

    ["<leader>sf"] = { ":%s//g<Left><Left>", " ", opts = { nowait = true } },
    ["<leader>sc"] = { ":s//g<Left><Left>", " ", opts = { nowait = true } },
    ["<leader>ss"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], " ", opts = { nowait = true } },
    ["<leader>ex"] = { "ggVG<esc>:'<,'>s/$/changethis/<left>", " ", opts = { nowait = true } },

    ["<C-f>"] = { "<cmd>silent !tmux neww tmux-sessionizer<cr>", " ", opts = { nowait = true } },
    ["<leader>X"] = { "<cmd>!chmod +x %<CR>", " ", opts = { nowait = true } },

    ["<C-Up>"] = { "<cmd>resize +2<cr>", " ", opts = { nowait = true } },
    ["<C-Down>"] = { "<cmd>resize -2<cr>", " ", opts = { nowait = true } },
    ["<C-Left>"] = { "<cmd>vertical resize -2<cr>", " ", opts = { nowait = true } },
    ["<C-Right>"] = { "<cmd>vertical resize +2<cr>", " ", opts = { nowait = true } },

    ["<Tab>"] = { "<cmd>b#<cr>", " ", opts = { nowait = true } },

    ["<M-j>"] = { "<C-f>" },
    ["<M-k>"] = { "<C-b>" },

    ["<M-J>"] = { "<cmd>t.<cr>", " ", opts = { nowait = true } },
    ["<M-K>"] = { "<cmd>t -1<cr>", " ", opts = { nowait = true } },
    ["<M-Down>"] = { "<cmd>m+<cr>", " ", opts = { nowait = true } },
    ["<M-Up>"] = { "<cmd>m-2<cr>", " ", opts = { nowait = true } },

    ["J"] = { "mzJ`z", " ", opts = { nowait = true } },
    ["C-d"] = { "<C-d>zz", " ", opts = { nowait = true } },
    ["C-u"] = { "<C-u>zz", " ", opts = { nowait = true } },

    ["<leader>ww"] = { "<cmd>w<cr>", "", opts = { nowait = true } },
    ["<leader>q"] = { "<cmd>q<cr>", "", opts = { nowait = true } },
    ["<leader>;"] = { ":", "", opts = { nowait = true } },
    ["<Q>;"] = { "@q", "", opts = { nowait = true } },

    ["<leader>tn"] = { "<cmd>set nu!<CR>", " ", opts = { nowait = true } },
    ["<leader>tr"] = { "<cmd>set rnu!<CR>", " ", opts = { nowait = true } },

    ["<M-z>"] = { "<cmd>set wrap!<CR>", " ", opts = { nowait = true } },

    ["="] = { "<C-a>", " ", opts = { nowait = true } },
    ["-"] = { "<C-x>", " ", opts = { nowait = true } },

    ["<leader>sp"] = { ":let @+ = expand('%:p')<CR>", " ", opts = { nowait = true } },
    ["<leader>sa"] = { "mjggVG", " ", opts = { nowait = true } },
    ["<leader>sq"] = { ":$put =range(0,10)<left><left><left><left>", " ", opts = { nowait = true } },

    ["<leader>sl"] = { "<C-w>v", "split window vertically", opts = { nowait = true } },
    ["<leader>sj"] = { "<C-w>s", "split window horizontally", opts = { nowait = true } },
    ["<leader>se"] = { "<C-w>=", "make split windows equal width & height", opts = { nowait = true } },
    ["<leader>sk"] = { "<cmd>close<cr>", "close current split window ", opts = { nowait = true } },

    ["<leader>fn"] = { "<cmd>enew<cr>", " ", opts = { nowait = true } },
    ["<leader>oo"] = { ":e ", " ", opts = { nowait = true } },
    ["<leader>on"] = { ":split ", " ", opts = { nowait = true } },
    ["<leader>om"] = { ":vsplit ", " ", opts = { nowait = true } },

    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<C-]>"] = { function() require("Comment.api").toggle.linewise.current() end, " ", opts = { nowait = true } },
    ["<c-c>"] = { '"+y', " ", opts = { nowait = true } },
    ["<c-S-v>"] = { '"+p', " ", opts = { nowait = true } },
    ["<S-Down>"] = { "<cmd>t.<cr>", " ", opts = { nowait = true } },
    ["<S-Up>"] = { "<cmd>t -1<cr>", " ", opts = { nowait = true } },
    -- ["<M-j>"] = { "<cmd>m+<cr>", " ", opts = { nowait = true } },
    -- ["<M-k>"] = { "<cmd>m-2<cr>", " ", opts = { nowait = true } },
    -- ["<C-f>"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", " ", opts = { nowait = true } },
    ["<leader>bb"] = { "<cmd>tabnew<cr>", " ", opts = { nowait = true } },
    -- ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", " ", opts = { nowait = true } },
    -- ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", " ", opts = { nowait = true } },
    -- ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", " ", opts = { nowait = true } },
    ["<leader>u"] = { "Gzt", " ", opts = { nowait = true } }, -- go to last line and zz
    -- Change (change the $) or add in the end of the line (ex: .extension)
    -- set mark first (vline and escape)
    ["<leader>cx"] = { ":'<,'>s/$/changeMe/<left>", " ", opts = { nowait = true } },
    -- all line
    ["<leader>cX"] = { "gg V G <esc> :'<,'>s/$/changeMe/<left>", " ", opts = { nowait = true } },
    -- color picker
    ["<leader>gg"] = { "<cmd>VCoolor<CR>", " ", opts = { nowait = true } },
  },

  i = {
    ["jk"] = { "<ESC>l", "escape insert mode", opts = { nowait = true } },
    ["<C-c>"] = { '"+y', " ", opts = { nowait = true } },
    ["<C-x>"] = { '"+x', " ", opts = { nowait = true } },
    ["<C-S-v>"] = { '"+p', " ", opts = { nowait = true } },
    ["<C-v>"] = { "<c-r>+", " ", opts = { nowait = true } },
    ["<S-Down>"] = { "<cmd>t.<cr>", " ", opts = { nowait = true } },
    ["<M-Down>"] = { "<cmd>m+<cr>", " ", opts = { nowait = true } },
    ["<S-Up>"] = { "<cmd>t -1<cr>", " ", opts = { nowait = true } },
    ["<M-Up>"] = { "<cmd>m-2<cr>", " ", opts = { nowait = true } },
    ["<C-l>"] = { "<cmd>LiveServer start<cr><cr>", " ", opts = { nowait = true } },
    ["<C-f>"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", " ", opts = { nowait = true } },
    ["<F6>"] = { "<cmd>set nu!<CR>", " ", opts = { nowait = true } },
    ["<F7>"] = { "<cmd>set rnu!<CR>", " ", opts = { nowait = true } },
    ["<M-z>"] = { "<cmd>set wrap!<CR>", " ", opts = { nowait = true } },
  },
  v = {
    ["<C-]>"] = {
      "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
      " ",
      opts = { nowait = true },
    },
    ["<A-j>"] = { ":m .+1<CR>==", " ", opts = { nowait = true } },
    ["<A-k>"] = { ":m .-2<CR>==", " ", opts = { nowait = true } },
    ["p"] = { '"_dP', " ", opts = { nowait = true } },
    ["<C-c>"] = { '"+y', " ", opts = { nowait = true } },
    ["<C-x>"] = { '"+x', " ", opts = { nowait = true } },
    ["<C-v>"] = { '"+p', " ", opts = { nowait = true } },
    ["J"] = { ":move '>+1<CR>gv-gv", " ", opts = { nowait = true } },
    ["K"] = { ":move '<-2<CR>gv-gv", " ", opts = { nowait = true } },
    -- ["<A-j>"] = { ":move '>+1<CR>gv-gv", " ", opts = { nowait = true } },
    ["<A-Down>"] = { ":move '>+1<CR>gv-gv", " ", opts = { nowait = true } },
    -- ["<A-k>"] = { ":move '<-2<CR>gv-gv", " ", opts = { nowait = true } },
    ["<A-Up>"] = { ":move '<-2<CR>gv-gv", " ", opts = { nowait = true } },
    ["<S-Down>"] = { ":'<,'>t'><cr>", " ", opts = { nowait = true } },
    ["<M-z>"] = { "<cmd>set wrap!<CR>", " ", opts = { nowait = true } },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<C-p>"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },
}

M.gitsigns = {
  plugin = true,

  n = {
    -- Navigation through hunks
    ["<A-S-j>"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["<A-S-k>"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    -- Actions
    ["<leader>hr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },

    ["<A-S-v>"] = {

      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },

    ["<leader>hp"] = {

      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },

    ["<leader>gb"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "Blame line",
    },

    ["<leader>td"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  },
}

M.tmux = {
  n = {
    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd>TmuxNavigateUp<CR>", "window up" },
  }
}

return M
