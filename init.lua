-- 基础设置
require('basic')
-- 键盘映射
require("keymaps")
-- Packer插件管理
require("plugins")
-- Color Themes
require("themes")
-- 插件配置
require("configs.nvim-tree")
require("configs.bufferline")
require("configs.lualine")
require("configs.telescope")
require("configs.dashboard")
require("configs.project")
require("configs.nvim-treesitter")
require("configs.indent-blankline")
-- 内置LSP
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
