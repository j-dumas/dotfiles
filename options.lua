require "nvchad.options"

vim.opt.relativenumber = true

-- Use powershell on Windows
if jit then
  if jit.os == "Windows" then
    if vim.fn.executable "pwsh" == 1 then
      vim.o.shell = "pwsh"
    else
      vim.o.shell = "powershell"
    end
  end
end
