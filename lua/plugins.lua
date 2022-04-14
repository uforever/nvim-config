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

    -- nvim-tree
    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
    })
    -- bufferline
    use({
      "akinsho/bufferline.nvim",
      requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
    })
    -- lualine
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
    })
    use("arkav/lualine-lsp-progress")
    -- telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })
    -- dashboard-nvim
    use("glepnir/dashboard-nvim")
    -- project
    use("ahmedkhalf/project.nvim")
    -- treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    })
    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")

    ---- LSP ----
    -- Lspconfig
    use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" })
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- Snippet 引擎
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")
    -- UI 增强
    use("onsails/lspkind-nvim")
    use("tami5/lspsaga.nvim")
    -- 代码格式化
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    -- copilot.vim
    use({ "github/copilot.vim" })

    ---- Color Themes ----
    -- onedark
    use 'navarasu/onedark.nvim'
    -- tokyonight
    use 'folke/tokyonight.nvim'
  end,
  config = {
    -- 并发数限制
    max_jobs = 16,
  },
})
