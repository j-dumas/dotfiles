local plugins = {
  "vale1410/vim-minizinc",
  lazy = true,
  ft = "zinc",
  config = function() 
    vim.g.zinc_no_highlight_overlong = 1 -- For comments to stay gray
  end,
}

if jit then
  if jit.os == "Windows" then
    return plugins
  end
end
