return {
  -- Other plugins...

  {
    "fatih/vim-go",
    run = ":GoUpdateBinaries",
    ft = { "go", "tmpl", "gotmpl" }, -- Supports Go and Go templates
    config = function()
      require("go").setup({})
    end,
  },
}
