vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
    -- Packer
    use {'wbthomason/packer.nvim', opt = true}

    -- libs
    use 'tpope/vim-repeat'

    -- editing
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'svermeulen/vim-subversive'

    -- movement and search
    use 'junegunn/vim-slash'
    use 'markonm/traces.vim'

    -- searching and file browsing
    use {
        'nvim-lua/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        }
    }
    -- use {
    --     'nvim-treesitter/nvim-treesitter-refactor',
    --     requires = {
    --         'nvim-treesitter/nvim-treesitter'
    --     },
        
    -- }
    use 'mhinz/vim-startify'

    -- text objects and motions
    use 'wellle/targets.vim'
    use 'jiangmiao/auto-pairs'
    use 'alvan/vim-closetag'
    use 'matze/vim-move'
    use 'godlygeek/tabular'

    -- syntax and languages
    use {'lervag/vimtex', ft = {'tex'}}
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'rust-lang/rust.vim'

    -- theme
    use 'deviantfero/wpgtk.vim'
    use {
        'tjdevries/express_line.nvim',
        requires = {'nvim-lua/plenary.nvim'}
    }
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    -- version control
    use 'junegunn/gv.vim'
    use 'tpope/vim-fugitive'
    use 'rhysd/git-messenger.vim'
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      }
    }

    use 'rhysd/committia.vim'

    -- project management
    use 'tpope/vim-projectionist'

    -- debugging
    use 'puremourning/vimspector'
end)
