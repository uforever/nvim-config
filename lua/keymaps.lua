-- normal_mode = "n"
-- insert_mode = "i"
-- visual_mode = "v"
-- visual_block_mode = "x"
-- term_mode = "t"
-- command_mode = "c"

-- 空格作为Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
  noremap = true,
  silent = true,
}

-- 本地变量
local map = vim.api.nvim_set_keymap

-- insert模式
-- 退出编辑模式
map("i", "jk", "<Esc>", opt)
-- 跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

-- normal模式
-- 针对60%键盘配置
map("n", "<Esc>", "~", opt)
-- 分屏快捷键
map("n", "<Leader>sj", ":sp<CR>", opt)
map("n", "<Leader>sk", ":set nosb | sp | set sb<CR>", opt)
map("n", "<Leader>sl", ":vs<CR>", opt)
map("n", "<Leader>sh", ":set nospr | vs | set spr<CR>", opt)
-- 关闭当前
map("n", "<Leader>wq", "<C-w>c", opt)
-- 关闭其他
map("n", "<Leader>w<CR>", "<C-w>o", opt)
-- 窗口之间跳转
map("n", "<Leader>wh", "<C-w>h", opt)
map("n", "<Leader>wj", "<C-w>j", opt)
map("n", "<Leader>wk", "<C-w>k", opt)
map("n", "<Leader>wl", "<C-w>l", opt)
-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
map("n", "<C-u>", "8k", opt)
map("n", "<C-d>", "8j", opt)
-- 窗口尺寸调整
map("n", "<Leader>ww", "<C-w>=", opt)
map("n", "<A-h>", ":vert res -2<CR>", opt)
map("n", "<A-j>", ":res -2<CR>", opt)
map("n", "<A-k>", ":res +2<CR>", opt)
map("n", "<A-l>", ":vert res +2<CR>", opt)
-- Terminal相关
map("n", "<leader>'", ":sp | terminal<CR>", opt)
map("t", "jk", [[ <C-\><C-n> ]],opt)
map("t", "<Leader>wh", [[ <C-\><C-n><C-w>h ]], opt)
map("t", "<Leader>wj", [[ <C-\><C-n><C-w>j ]], opt)
map("t", "<Leader>wk", [[ <C-\><C-n><C-w>k ]], opt)
map("t", "<Leader>wl", [[ <C-\><C-n><C-w>l ]], opt)

-- visual模式
-- 连续缩进代码
map("v", ">", ">gv", opt)
map("v", "<", "<gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree 文件树
-- 打开/关闭tree
map("n", "<F3>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "l", action = "vsplit" },
  -- { key = "", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_ignored" }, -- Ignore (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "o", action = "create" },
  { key = "d", action = "remove" },
  { key = "s", action = "rename" },
  { key = "x", action = "cut" },
  { key = "y", action = "copy" },
  { key = "p", action = "paste" },
  { key = "f", action = "system_open" },
}

-- bufferline
-- 左右Tab切换
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opt)
map("n", "<Leader>bh", ":BufferLineCyclePrev<CR>", opt)
map("n", "<Leader>bl", ":BufferLineCycleNext<CR>", opt)
-- "moll/vim-bbye" 关闭当前 buffer
map("n", "<Leader>bj", ":Bdelete!<CR>", opt)
-- 关闭其他标签页
map("n", "<leader>bk", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)

return pluginKeys
