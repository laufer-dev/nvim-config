(macro mod [f]
  (let [s (tostring f)]
    `(fn [plugin# opts#]
       (let [load-and-configure# (fn [f# plugin# opts#]
                                   (let [m# (require f#)]
                                     (m#.config plugin# opts#)))
             (ok?# res#) (pcall load-and-configure# ,f plugin# opts#)]
         (if ok?#
             false
             (do
               (print (.. "Failed configuring: " ,s res#))
               true))))))

(let [(ok? lazy) (pcall #(require :lazy))]
  (when ok?
    (lazy.setup [{1 :Olical/nfnl :ft :fennel :lazy false}
                 {1 :Olical/conjure
                  :ft :fennel
                  :config (mod :config.plugin.conjure)
                  :lazy true}
                 {1 :neovim/nvim-lspconfig
                  :ft [:fennel :lua :erlang :elixir :rust :idris2]
                  :config (mod :config.plugin.nvim-lspconfig)
                  :dependencies [[:ray-x/lsp_signature.nvim]]
                  :lazy true}
                 {1 :rose-pine/neovim
                  :config (mod :config.plugin.rose-pine)
                  :lazy false}
                 {1 :ggandor/leap.nvim
                  :config (mod :config.plugin.leap)
                  :lazy false}
                 {1 :nvim-treesitter/nvim-treesitter
                  :ft [:fennel :lua :rust :erlang :elixir :idris2]
                  :config (mod :config.plugin.treesitter)
                  :lazy true}
                 {1 :nvim-lualine/lualine.nvim :lazy false :opts {}}
                 {1 :mbbill/undotree
                  :cmd [:UndoTreeToggle
                        :UndoTreeHide
                        :UndoTreeShow
                        :UndoTreeFocus]
                  :lazy true
                  :opts {}}
                 {1 :hrsh7th/nvim-cmp
                  :dependencies [[:PaterJason/cmp-conjure]
                                 [:hrsh7th/cmp-buffer]
                                 [:hrsh7th/cmp-cmdline]
                                 [:hrsh7th/cmp-nvim-lsp]
                                 [:hrsh7th/cmp-path]
                                 [:hrsh7th/cmp-omni]
                                 [:hrsh7th/cmp-nvim-lua]]
                  :config (mod :config.plugin.cmp)
                  :lazy false}
                 {1 :elentok/format-on-save.nvim
                  :config (mod :config.plugin.format-on-save)
                  :lazy false}
                 {1 :folke/which-key.nvim :lazy false :opts {}}
                 {1 :nvim-telescope/telescope.nvim
                  :cmd :Telescope
                  :config (mod :config.plugin.telescope)
                  :dependencies [[:nvim-lua/popup.nvim]
                                 [:nvim-lua/plenary.nvim]
                                 [:nvim-telescope/telescope-ui-select.nvim]
                                 [:barrett-ruth/telescope-http.nvim]
                                 [:nvim-telescope/telescope-dap.nvim]
                                 [:nvim-treesitter/nvim-treesitter]
                                 [:natecraddock/telescope-zf-native.nvim]
                                 [:debugloop/telescope-undo.nvim]]}
                 {1 "https://gitlab.com/HiPhish/rainbow-delimiters.nvim"
                  :lazy false}
                 {1 :tpope/vim-commentary}
                 {1 :tpope/vim-fugitive}
                 {1 :tpope/vim-surround}
                 {1 :NMAC427/guess-indent.nvim :lazy false}
                 {1 :jdhao/whitespace.nvim :lazy false}
                 {1 :kyazdani42/nvim-tree.lua
                  :cmd [:NvimTreeToggle
                        :NvimTreeClipboard
                        :NvimTreeClose
                        :NvimTreeCollapse
                        :NvimTreeCollapseKeepBuffers
                        :NvimTreeFindFile
                        :NvimTreeFindFileToggle
                        :NvimTreeFocus
                        :NvimTreeOpen
                        :NvimTreeRefresh
                        :NvimTreeResize
                        :NvimTreeToggle]
                  :lazy true
                  :opts {}}
                 {1 :mfussenegger/nvim-dap}
                 {1 :rcarriga/nvim-dap-ui}
                 {1 :simrat39/rust-tools.nvim
                  :dependencies [[:nvim-lua/plenary.nvim]]}
                 {1 :akinsho/toggleterm.nvim :cmd [:ToggleTerm]}
                 {1 :rose-pine/neovim :lazy false}
                 {1 :terryma/vim-expand-region :lazy false}
                 {1 :MunifTanjim/nui.nvim :lazy false}
                 {1 :ShinKage/idris2-nvim
                  :requires [:neovim/nvim-lspconfig :MunifTanjim/nui.nvim]
                  :ft [:idris2]
                  :config (mod :config.plugin.idris2)}])))
