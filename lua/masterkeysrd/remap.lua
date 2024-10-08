vim.g.mapleader = " "

local keymap = vim.keymap.set

local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

keymap("i", "jj", "<Esc>", opts("Go to normal mode with jj"))

-- Save with Ctrl+s
keymap("n", "<C-S>", vim.cmd.w, opts("Save file"))
keymap("i", "<C-S>", vim.cmd.w, opts("Save file"))

-- In visual mode move text with J and K
keymap("x", "K", ":move -2<CR>gv=gv", opts("Move text up"))
keymap("x", "J", ":move '>+<CR>gv=gv", opts("Move text down"))

-- splits
keymap("n", "<C-J>", "<C-W><C-J>", opts("Move to split below"))
keymap("n", "<C-K>", "<C-W><C-K>", opts("Move to split above"))
keymap("n", "<C-L>", "<C-W><C-L>", opts("Move to split right"))
keymap("n", "<C-H>", "<C-W><C-H>", opts("Move to split left"))
keymap("n", "<C-=>", "<C-W>=", opts("Balance splits"))
keymap("n", "<C-S-l>", "<C-W>2<", opts("Decrease split width"))
keymap("n", "<C-S-h>", "<C-W>2>", opts("Increase split width"))
keymap("n", "<C-S-j>", "<C-W>2-", opts("Decrease split height"))
keymap("n", "<C-S-k>", "<C-W>2+", opts("Increase split height"))


-- tabs
keymap("n", "H", vim.cmd.bp, opts("Previous buffer"))
keymap("n", "L", vim.cmd.bn, opts("Next buffer"))

if vim.lsp.inlay_hint then
  keymap("n", "<leader>ch", function()
    local is_enabled = vim.lsp.inlay_hint.is_enabled({ 0 })
    vim.lsp.inlay_hint.enable(not is_enabled, { 0 })
  end, opts("Toggle inlay hints"))
end

if vim.lsp.codelens then
  keymap("n", "<leader>cc", vim.lsp.codelens.run, opts("Run code lens"))
  keymap("n", "<leader>cC", vim.lsp.codelens.refresh, opts("Refresh code lens"))
end
