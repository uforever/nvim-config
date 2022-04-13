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
map("n", "<Leader>'", ":sp | terminal<CR>", opt)
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

-- treesitter 折叠
-- map("n", "<Leader>zc", ":foldclose<CR>", opt)
-- map("n", "<Leader>zo", ":foldopen<CR>", opt)

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  mapbuf("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  mapbuf("n", "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", "<Leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "<Leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "<Leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  mapbuf("n", "<Leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- diagnostic
  mapbuf("n", "<Leader>gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "<Leader>gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "<Leader>gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- 没用到
  -- mapbuf('n', '<Leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- 格式化缩进
map('n', '<Leader>fm', 'gg=G<C-o>', opt)

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
map("n", "<Leader>fh", ":BufferLineCyclePrev<CR>", opt)
map("n", "<Leader>fl", ":BufferLineCycleNext<CR>", opt)
-- "moll/vim-bbye" 关闭当前 buffer
map("n", "<Leader>fk", ":Bdelete!<CR>", opt)
-- 关闭其他标签页
map("n", "<Leader>fj", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

-- 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    -- ["<Down>"] = "move_selection_next",
    -- ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-h>"] = "cycle_history_next",
    ["<C-l>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-k>"] = "preview_scrolling_up",
    ["<C-j>"] = "preview_scrolling_down",
  },
}

return pluginKeys
