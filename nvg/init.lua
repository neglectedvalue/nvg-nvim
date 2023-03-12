local function init()
  require 'nvg.packer'.init()
  require 'nvg.vim'.init()
end

return 
{
  init = init,
}
