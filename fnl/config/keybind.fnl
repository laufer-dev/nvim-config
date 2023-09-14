(vim.keymap.set :n :<leader>tf ":NvimTreeToggle<cr>"
                {:desc "nvim-tree: toggle"
                 :noremap true
                 :silent true
                 :nowait true})

(vim.keymap.set :n :<leader>fa ":Telescope autocommands<cr>"
                {:desc "Telescope: autocommands"
                 :noremap true
                 :silent true
                 :nowait true})

(vim.keymap.set :n :<leader>fb ":Telescope buffers<cr>"
                {:desc "Telescope: buffers"
                 :noremap true
                 :silent true
                 :nowait true})

(vim.keymap.set :n :<leader>fcl ":Telescope commands<cr>"
                {:desc "Telescope: command list"
                 :noremap true
                 :silent true
                 :nowait true})

(vim.keymap.set :n :<leader>fch ":Telescope command_history<cr>"
                {:desc "Telescope: command history"
                 :noremap true
                 :silent true
                 :nowait true})

(vim.keymap.set :n :<leader>fd ":Telescope diagnostics<cr>"
                {:desc "Telescope: diagnostics"
                 :noremap true
                 :silent true
                 :nowait true})

(vim.keymap.set :n :<leader>ff ":Telescope find_files<cr>"
                {:desc "Telescope: find files"
                 :noremap true
                 :silent true
                 :nowait true})

(vim.keymap.set :n :<leader>fg ":Telescope git_files<cr>"
                {:desc "Telescope: git files"
                 :noremap true
                 :silent true
                 :nowait true})

(vim.keymap.set :n :<leader>ft ":Telescope filetypes<cr>"
                {:desc "Telescope: filetypes"
                 :noremap true
                 :silent true
                 :nowait true})
