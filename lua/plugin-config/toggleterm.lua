require("toggleterm").setup{
  size = function(term)
    if term.direction == "horizontal" then
      return vim.o.columns * 0.05
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.5
    end
  end,
--  direction = 'vertical',
--  direction = 'float'
--  direction = 'tab'
}
