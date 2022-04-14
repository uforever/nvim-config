--[[
---- insert mode ----
  jk                   退出insert模式
  <C-a>/<C-e>          光标移动至行首/行尾

-- plugins
  <Ctrl - o/c>         打开/关闭自动补全
  <Ctrl - h/l>         上下滚动预览窗
  <Tab><S-Tab>         snippets跳转

  <C-f>                接受补全
  <C-b>                隐藏补全
  <Alt - [/]>          切换补全

---- normal mode ----
  <Esc>                改变大小写
  <Leader>s + h/j/k/l  分屏
  <Leader>w + h/j/k/l  窗口间跳转
  <Leader>w<BS>        退出当前窗口
  <Leader>w<CR>        关闭其余窗口
  <Leader>aa           窗口平均分布(*)
  <Alt - h/j/k/l>      调整窗口尺寸
  <C-j>/<C-k>          上下移动多行
  <C-s>                保存文件
  <Leader>'            调出终端(2)

-- plugins
  za/zc/zo             折叠代码(default)

  <Leader>rn           重命名(*)

  <Leader>go           跳转原始定义
  <Leader>gu           跳转引用
  <Leader>gd           跳转定义
  <Leader>gh           跳转文档
  <Leader>ga           提示动作

  <Leader>ep           打印错误详情
  <Leader>ej           跳转下一处错误
  <Leader>ek           跳转上一处错误

  <Leader>.            自动调整缩进(2)
  <Leader>fm           格式化代码(*)
  <F3>                 打开文件树
  <Leader>cp           提示代码面板

-- file tree
  i/.                  显示ignore/隐藏文件
  <F5>                 刷新
  o                    新建文件
  d                    删除文件
  s                    文件重命名
  x                    文件剪切
  y                    文件复制
  p                    文件粘贴
  f                    使用系统程序打开文件

-- table line
  <Leader>t + h/l      左右切换tab页
  <Leader>t<BS>        关闭当前tab页
  <Leader>t<CR>        关闭其余tab页

-- search
  <C-p>                搜索文件
  <C-f>                全局搜索

-- telescope
  <Ctrl - j/k>         上下滚动预览窗
  <Ctrl - h/l>         搜索历史记录
  <Ctrl - c/d>         关闭窗口

---- visual mode ----
  J/K                  上下移动选中的文本
--]]

-- 空格作为Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
  noremap = true,
  silent = true,
}

-- 本地变量
local map = vim.api.nvim_set_keymap

-- normal_mode = "n"
-- insert_mode = "i"
-- visual_mode = "v"
-- visual_block_mode = "x"
-- term_mode = "t"
-- command_mode = "c"

-- insert模式
map("i", "jk", "<Esc>", opt)
map("i", "<C-a>", "<ESC>I", opt)
map("i", "<C-e>", "<ESC>A", opt)

-- normal模式
-- 针对60%键盘配置
map("n", "<Esc>", "~", opt)

map("n", "<C-s>", ":w<CR>", opt)

map("n", "<Leader>sj", ":sp<CR>", opt)
map("n", "<Leader>sk", ":set nosb | sp | set sb<CR>", opt)
map("n", "<Leader>sl", ":vs<CR>", opt)
map("n", "<Leader>sh", ":set nospr | vs | set spr<CR>", opt)
map("n", "<Leader>w<BS>", "<C-w>c", opt)
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
map("n", "<Leader>aa", "<C-w>=", opt)
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

-- Copilot
map("i", "<C-f>", [[ copilot#Accept("\<CR>") ]], { silent = true, script = true, expr = true })
map('i', '<C-b>', '<Plug>(copilot-dismiss)', { noremap = false })
map('i', '<A-]>', '<Plug>(copilot-next)', { noremap = false })
map('i', '<A-[>', '<Plug>(copilot-previous)', { noremap = false })
-- map('n', '<Leader>cs', ':Copilot setup<CR>', opt)
-- map('n', '<Leader>ce', ':Copilot enable<CR>', opt)
-- map('n', '<Leader>cd', ':Copilot disable<CR>', opt)
map('n', '<Leader>cp', ':Copilot panel<CR>', opt)

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  return {
    -- 出现补全
    ["<C-o>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    -- 取消
    ["<C-c>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close()
    }),
    -- 上一个
    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
    -- 下一个
    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}),
    -- 确认
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    ["<C-h>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
    ["<C-l>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),

    -- snippets 跳转
    --[[
    ["<C-j>"] = cmp.mapping(function(_)
      if vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      end
    end, { "i", "s" }),

    ["<C-k>"] = cmp.mapping(function()
      if vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    --]]

    -- super Tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  }
end

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  mapbuf("n", "<Leader>rn", "<cmd>Lspsaga rename<CR>", opt)
  mapbuf("n", "<Leader>go", "<cmd>Lspsaga preview_definition<CR>", opt)
  mapbuf("n", "<Leader>gu", "<cmd>Lspsaga lsp_finder<CR>", opt)
  mapbuf("n", "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", "<Leader>gh", "<cmd>Lspsaga hover_doc<CR>", opt)
  mapbuf("n", "<leader>ga", "<cmd>Lspsaga code_action<CR>", opt)
  mapbuf("n", "<Leader>fm", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opt)
  mapbuf("n", "<Leader>ep", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
  mapbuf("n", "<Leader>ej", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)
  mapbuf("n", "<Leader>ek", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
end

map('n', '<Leader>.', 'gg=G<C-o>', opt)
map("n", "<F3>", ":NvimTreeToggle<CR>", opt)

-- 列表快捷键
pluginKeys.nvimTreeList = {
  { key = {"<CR>", "<2-LeftMouse>"}, action = "edit" },
  { key = "l", action = "vsplit" },
  { key = "i", action = "toggle_ignored" }, -- Ignore (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  { key = "<F5>", action = "refresh" },
  { key = "o", action = "create" },
  { key = "d", action = "remove" },
  { key = "s", action = "rename" },
  { key = "x", action = "cut" },
  { key = "y", action = "copy" },
  { key = "p", action = "paste" },
  { key = "f", action = "system_open" },
}

-- 左右Tab切换
-- map("n", "<Tab>", ":BufferLineCycleNext<CR>", opt)
map("n", "<Leader>th", ":BufferLineCyclePrev<CR>", opt)
map("n", "<Leader>tl", ":BufferLineCycleNext<CR>", opt)
-- "moll/vim-bbye" 关闭当前 buffer
map("n", "<Leader>t<BS>", ":Bdelete!<CR>", opt)
-- 关闭其他标签页
map("n", "<Leader>t<CR>", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)

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
    ["<C-d>"] = "close",
    -- 预览窗口上下滚动
    ["<C-k>"] = "preview_scrolling_up",
    ["<C-j>"] = "preview_scrolling_down",
  },
}

return pluginKeys
