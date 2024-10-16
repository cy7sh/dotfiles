require("plugin_specs")

local keymap = vim.keymap
local lsp = vim.lsp
local diagnostic = vim.diagnostic
local opt = vim.opt

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
require("nvim-tree").setup()

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.relativenumber = true
opt.smartcase = true
opt.scrolloff = 3
opt.confirm = true
opt.history = 500
opt.undofile = true
opt.termguicolors = true

vim.cmd.colorscheme "tokyonight-night"

vim.g.Lf_DefaultExternalTool = "rg"
vim.g.Lf_ShorcutF = ''
vim.g.Lf_ShorcutB = ''

keymap.set("n", "<space>s", require("nvim-tree.api").tree.toggle, {
  desc = "toggle nvim-tree",
  silent = true,
})

-- shortcut to command mode
keymap.set({ "n", "x" }, ";", ":", { silent = true })

keymap.set("n", [[\d]], "<cmd>bprevious <bar> bdelete #<cr>", {
  silent = true,
  desc = "delete current buffer",
})

keymap.set("n", "<space>o", "printf('m`%so<ESC>``', v:count1)", {
  expr = true,
  desc = "insert line below without moving cursor",
})

keymap.set("n", "<space>O", "printf('m`%sO<ESC>``', v:count1)", {
  expr = true,
  desc = "insert line above without moving cursor",
})

keymap.set("n", "/", [[/\v]])

keymap.set("n", "c", '"_c')
keymap.set("n", "C", '"_C')
keymap.set("n", "cc", '"_cc')
keymap.set("x", "c", '"_c')
keymap.set("x", "p", '"_c<Esc>p')

-- Break inserted text into smaller undo units when we insert some punctuation chars.
local undo_ch = { ",", ".", "!", "?", ";", ":" }
for _, ch in ipairs(undo_ch) do
  keymap.set("i", ch, ch .. "<c-g>u")
end

keymap.set("i", "<C-A>", "<HOME>")
keymap.set("i", "<C-E>", "<END>")

keymap.set("n", "<leader>ff", ":<C-U>Leaderf file --popup<CR>", { silent = true })
keymap.set("n", "<leader>fg", ":<C-U>Leaderf rg --no-messages --popup<CR>", { silent = true })
keymap.set("n", "<leader>fh", ":<C-U>Leaderf help --popup<CR>", { silent = true })
keymap.set("n", "<leader>ft", ":<C-U>Leaderf bufTag --popup<CR>", { silent = true })
keymap.set("n", "<leader>fr", ":<C-U>Leaderf mru --popup --absolute-path<CR>", { silent = true })
