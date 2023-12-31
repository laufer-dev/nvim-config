-- [nfnl] Compiled from fnl/config/plugin/cmp.fnl by https://github.com/Olical/nfnl, do not edit.
local function config(plugin, opts)
  vim.o.completeopt = "menuone,noselect"
  local ok_3f, cmp = nil, nil
  local function _1_()
    return require("cmp")
  end
  ok_3f, cmp = pcall(_1_)
  if ok_3f then
    cmp.setup({sources = {{name = "conjure"}, {name = "nvim_lsp"}, {name = "buffer"}, {name = "path"}, {name = "rg", keyword_length = 5, option = {debounce = 1000}}, {name = "nvim_lua"}}, view = {entries = "native"}, mapping = cmp.mapping.preset.insert({["<C-b>"] = cmp.mapping.scroll_docs(-4), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.abort(), ["<CR>"] = cmp.mapping.confirm({select = false})})})
    return cmp.setup.filetype("gitcommit", {sources = {{name = "cmp_git"}, {name = "path"}, {name = "buffer"}, {name = "rg", keyword_length = 5, option = {debounce = 1000}}}})
  else
    return nil
  end
end
return {config = config}
