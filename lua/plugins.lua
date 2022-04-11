-- 初始化pakcer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("not found packer.nvim")
  return
end

packer.startup({
  function(use)
    -- Packer管理自身
    use 'wbthomason/packer.nvim'
    ---- 插件列表 ----
  end,
  config = {
    -- 并发数限制
    max_jobs = 16,
  },
})
