
return {
  'lervag/vimtex',
  config = function()
  -- vimtex
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_view_method = 'skim'
  end
}
