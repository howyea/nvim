require("toggleterm").setup{
  size = function(term)
    if term.direction == "horizontal" then
      return 10
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.3
    end
  end,
--  direction = 'vertical',
--  direction = 'float'
--  direction = 'tab'
}
