vim.g.mapleader = " "

-- Create a new line without entering insert mode
vim.keymap.set("n", "<CR>", "o<ESC>", {})

-- Puts the cursor in the middle of the expanded tags
vim.cmd([[
  inoremap <expr> <cr> getline('.')[col('.') - 1 - 1:col('.')-1] == '><' ? '<cr><c-o>O<tab>': '<cr>'
]])
