-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'xiyaowong/transparent.nvim'
    use 'mfussenegger/nvim-lint'
    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    yaml = { "prettier" },
                }
            })
        end,
    })
    use { "ellisonleao/carbon-now.nvim", config = function()
        require('carbon-now').setup({
            open_cmd = "open"
        })
    end }
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use({
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup()
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "folke/trouble.nvim",
            "nvim-telescope/telescope.nvim"
        }
    })

    use 'prichrd/netrw.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use 'voldikss/vim-floaterm'
    use 'lewis6991/gitsigns.nvim'
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use { 'numToStr/Comment.nvim' }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- use({ 'rose-pine/neovim', as = 'rose-pine' })
    --vim.cmd('colorscheme rose-pine')
    use { "catppuccin/nvim", as = "catppuccin" }
    vim.cmd.colorscheme "catppuccin"

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('github/copilot.vim')
    use('vim-pandoc/vim-pandoc')
    use('vim-pandoc/vim-pandoc-syntax')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
end)
