-- 半透明
vim.g.tokyonight_transparent = false
vim.g.tokyonight_transparent_sidebar = false

local colorscheme = "tokyonight"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. "not found")
  return
end
