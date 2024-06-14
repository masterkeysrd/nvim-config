require("masterkeysrd.set")
require("masterkeysrd.remap")
require("masterkeysrd.packer")
require("masterkeysrd.lsp")

local ok, notify = pcall(require, "notify")
if ok then
  vim.notify = notify
end
