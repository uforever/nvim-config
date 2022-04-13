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

    --------------------- LSP --------------------
    -- Lspconfig
    use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" })

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
