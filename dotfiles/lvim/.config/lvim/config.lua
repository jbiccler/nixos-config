--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- place this in one of your configuration file(s)
-- general

-- vim.opt.clipboard = "autoselect"
-- vim.g.python3_host_prog = "/usr/bin/python"
vim.opt.shell = "/bin/bash"
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.wrap = true -- display lines as one long line
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
vim.g.transparent_enabled = true

lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "tokyonight-night"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode['<C-z>'] = ':u<cr>'
lvim.keys.insert_mode["<C-s>"] = "<ESC>:w<cr>l"

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )


-- Bufferline
lvim.builtin.bufferline.options.numbers = 'buffer_id'

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
},
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    },
}
-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

--Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>") -- increment
vim.keymap.set("n", "<leader>-", "<C-x>") -- decrement
-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>ss", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization
-- remap first and last non-blank
vim.keymap.set('n',"<M-h>", '^')
vim.keymap.set('v',"<M-h>", '^')
vim.keymap.set('n',"<M-l>", 'g_')
vim.keymap.set('v',"<M-l>", 'g_')
-- leader y copies to system clipboard
vim.keymap.set({"n", "v"}, "<leader><leader>y", [["+y]])
vim.keymap.set("n", "<leader><leader>Y", [["+Y]])
vim.keymap.set("n", "<leader><leader>p", [["+p]])
vim.keymap.set("n", "<leader><leader>P", [["+P]])
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set('i','<C-j>','<ESC>:TmuxNavigateDown<CR>')
vim.keymap.set('i','<C-k>','<ESC>:TmuxNavigateUp<CR>')
vim.keymap.set('i','<C-l>','<ESC>:TmuxNavigateRight<CR>')
vim.keymap.set('i','<C-h>','<ESC>:TmuxNavigateLeft<CR>')
vim.keymap.set('i','<C-\\>','<ESC>:TmuxNavigatePrevious<CR>')
-- make executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")
-- python file
vim.keymap.set('n', '<leader>r', [[:silent !tmux send-keys -t 1 "python " %:p Enter <CR>]])
-- general just execute last command
vim.keymap.set('n', '<leader>R', [[:silent !tmux send-keys -t 1 "\!\!" Enter <CR>]])
-- Write all buffers before navigating from Vim to tmux pane
-- let g:tmux_navigator_save_on_switch = 1
-- let g:tmux_navigator_preserve_zoom = 1

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
"bash",
"c",
"javascript",
"json",
"lua",
"python",
"typescript",
"tsx",
"css",
"rust",
"java",
"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = true

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
{ command = "black", filetypes = { "python" } },
{ command = "isort", filetypes = { "python" } },
{
-- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
command = "prettier",
---@usage arguments to pass to the formatter
-- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
extra_args = { "--print-with", "100" },
---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
filetypes = { "typescript", "typescriptreact" },
},
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
{ command = "flake8", filetypes = { "python" } },
{
-- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
command = "shellcheck",
---@usage arguments to pass to the formatter
-- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
extra_args = { "--severity", "warning" },
},
{
command = "codespell",
---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
filetypes = { "javascript", "python" },
},
}

-- Additional Plugins
lvim.plugins = {
{
  "folke/trouble.nvim",
  cmd = "TroubleToggle",
},
{"szw/vim-maximizer"},
{"tpope/vim-surround"},
{
"phaazon/hop.nvim",
event = "BufRead",
config = function()
require("hop").setup()
vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<M-s>", ":HopPattern<cr>", { silent = true })
    vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
  end,
},
{
  'sudormrfbin/cheatsheet.nvim',

  requires = {
    {'nvim-telescope/telescope.nvim'},
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
  }},
{'christoomey/vim-tmux-navigator'},
{'shaunsingh/nord.nvim'},
{'ThePrimeagen/vim-be-good'},
{'xiyaowong/nvim-transparent',
 enable = true, -- boolean: enable transparent
 extra_groups = { -- table/string: additional groups that should be cleared
   -- In particular, when you set it to 'all', that means all available groups

   -- example of akinsho/nvim-bufferline.lua
   "BufferLineTabClose",
   "BufferlineBufferSelected",
   "BufferLineFill",
   "BufferLineBackground",
   "BufferLineSeparator",
   "BufferLineIndicatorSelected",
 },
 exclude = {},},
{
  'rmagatti/auto-session',
  config = function()
    require("auto-session").setup {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
    }
  end
}
}
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.json", "*.jsonc" },
  -- enable wrap mode for json files only
  command = "setlocal wrap",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})
