local options = {
  backspace = vim.opt.backspace + { "nostop" }, -- Don't stop backspace at insert
  nu = true,
  rnu = true,
  clipboard = "",                         -- set "unnamedplus" to connect to the system clipboard
  cmdheight = 1,                          -- hide command line unless needed
  completeopt = { "menuone", "noselect" }, -- Options for insert mode completion
  copyindent = true,                      -- Copy the previous indentation on autoindenting
  cursorline = true,                      -- Highlight the text line of the cursor
  expandtab = true,                       -- Enable the use of space in tab
  fileencoding = "utf-8",                 -- File content encoding for the buffer
  fillchars = { eob = " " },              -- Disable `~` on nonexistent lines
  history = 100,                          -- Number of commands to remember in a history table
  laststatus = 3,                         -- globalstatus
  lazyredraw = true,                      -- lazily redraw screen
  mouse = "a",                            -- Enable mouse support
  timeoutlen = 300,                       -- Length of time to wait for a mapped sequence
  swapfile = false,
  backup = false,
  writebackup = false,
  undodir = os.getenv("HOME") .. "/.vim/undodir",
  undofile = true,                        -- Enable persistent undo
  updatetime = 300,                       -- Length of time to wait before triggering the plugin
  wrap = false,                           -- Disable wrapping of lines longer than the width of window
  -- minimal number of screen columns either side of cursor if wrap is `false`
  -- guifont = "monospace:h17", -- the font used in graphical neovim applications
  guifont = "JetBrainsMono_Nerd_Font:h17", -- the font used in graphical neovim applications
  -- whichwrap = "bs<>[]hl", -- horizontal keys are allowed to travel to prev/next line
  whichwrap = "b,s",                      -- default (disabled)
  hlsearch = false,
  incsearch = true,
  ignorecase = true,
  splitbelow = true,
  splitright = true,
  virtualedit = "block",
  hidden = true,
}

vim.g.maplocalleader = ","
vim.opt.conceallevel = 2

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 16
-- vim.opt.colorcolumn = "80" -- vertical line
-- vim.opt.shortmess = "ilmnrx" -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append("c")                         -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append("-")                         -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" })       -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use
