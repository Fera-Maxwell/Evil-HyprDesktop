--[[
==========================================================================
NVIM Configuration: Sinister Blood Moon (Duskfox Edit)
Matched for Umbreon / Crimson Gentoo Bar
==========================================================================
]]

-- 1. BOOTSTRAP: paq-nvim
local paq_path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
if vim.fn.empty(vim.fn.glob(paq_path)) > 0 then
  print("Installing paq-nvim. Please restart NVIM after installation.")
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/savq/paq-nvim.git', paq_path})
end

local paq = require('paq')

-- 2. PLUGINS
paq({
  'EdenEast/nightfox.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-telescope/telescope.nvim',
  'numToStr/Comment.nvim',
  'tpope/vim-fugitive',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'norcalli/nvim-colorizer.lua',
  "romgrk/barbar.nvim",
})

-- 3. CORE OPTIONS
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.mouse = 'a'
vim.opt.termguicolors = true
vim.g.mapleader = ' '

vim.opt.fillchars:append({ eob=' ' })
vim.opt.background = 'dark'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

-- Color Autocmd: Back to basics
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Keeps your blood-red comments and yellow rings search
    vim.api.nvim_set_hl(0, "Comment", { fg = "#a64d4d", italic = true })
    vim.api.nvim_set_hl(0, "Search", { bg = "#ffcc00", fg = "#000000" })

    -- Force main window transparency (Keeps the background clear)
    vim.api.nvim_set_hl(0, "Normal", { bg="none" })
    vim.api.nvim_set_hl(0, "NonText", { bg="none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg="none" })
    
    -- We removed all the "Buffer" lines, so Barbar will 
    -- go back to its default gray/duskfox styling.
  end,
})

-- 4. KEYMAPS
vim.keymap.set('i', '`', '<Esc>')
vim.keymap.set('n', ',', 'i')
vim.keymap.set("n", "<leader>e", function()
  require("nvim-tree.api").tree.open({ path = vim.fn.expand("%:p:h"), current_window = true })
end)
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set({ 'n','v' }, 'gc', require('Comment.api').toggle.linewise.current)
vim.keymap.set('n', '<C-a>', function() vim.cmd('normal! 0ggVG') end)
vim.keymap.set('v', '<C-c>', '"+y')
vim.keymap.set('n', '<C-v>', '"+p')
vim.keymap.set('v', '<C-v>', '"+p')
vim.keymap.set('i', '<C-v>', '<C-r>+')
vim.keymap.set('n', '<C-z>', 'u')
vim.keymap.set('i', '<C-z>', '<C-o>u')
vim.keymap.set('n', '<C-y>', '<C-r>')
vim.keymap.set('i', '<C-y>', '<C-o><C-r>')
vim.keymap.set('n', '<C-t>', '<Cmd>enew<CR>', { silent = true })
vim.keymap.set('n', '<C-w>', '<Cmd>BufferClose<CR>', { silent = true, nowait = true })
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', { silent = true })
vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { silent = true })

-- 5. PLUGIN CONFIGURATION
vim.cmd.colorscheme("duskfox")

require("nvim-tree").setup({
  update_focused_file = { enable = true, update_root = true },
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  view = { width = { min = -1, max = -1 } },
  actions = { open_file = { quit_on_open = true } },
})

require('Comment').setup()
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<CR>'] = cmp.mapping.confirm({ select=true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
      else fallback() end
    end, {'i','s'}),
  },
  sources = { { name='nvim_lsp' }, { name='buffer' }, { name='path' }, { name='luasnip' } },
})

require('colorizer').setup({'*'})

vim.g.barbar_auto_setup = false
require("barbar").setup({
  animation = true,
  icons = { button = "", filetype = { enabled = true } },
})

-- 6. ZEN MODE
function ToggleZen()
  if vim.g.zen_mode then
    vim.opt.number, vim.opt.relativenumber = true, true
    vim.opt.laststatus, vim.opt.signcolumn = 2, "yes"
    vim.opt.showmode, vim.opt.showcmd = true, true
    vim.g.zen_mode = false
  else
    vim.opt.number, vim.opt.relativenumber = false, false
    vim.opt.laststatus, vim.opt.signcolumn = 0, "no"
    vim.opt.showmode, vim.opt.showcmd = false, false
    vim.g.zen_mode = true
  end
end
vim.keymap.set('n','<leader>z',ToggleZen)
