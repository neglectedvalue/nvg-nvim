local function init()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  map('n', '<leader>lg', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazygit<CR>', options)
  map('n', '<leader>tt', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 zsh<CR>', options)
  map('n', '<leader>nn', '<CMD>FloatermNew --autoclose=2 --height=0.5 --width=0.5 nnn -Hde<CR>', options)
end

return {
  init = init
}
