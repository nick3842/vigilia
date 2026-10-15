local ok, err = pcall(function()
  local root = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h:h")
  vim.opt.runtimepath:prepend(root)
  local theme = require("vigilia")
  local function hl(name)
    return vim.api.nvim_get_hl(0, { name = name, link = false })
  end
  local function load()
    vim.cmd.colorscheme("vigilia")
    assert(vim.g.colors_name == "vigilia")
    assert(vim.o.termguicolors)
  end

  load()
  assert(hl("Normal").bg == 0x151E2C)
  assert(hl("Comment").italic == true)
  assert(hl("DiagnosticError").fg == 0xD46A72)
  for i = 0, 15 do
    assert(vim.g["terminal_color_" .. i]:match("^#%x%x%x%x%x%x$"))
  end

  theme.setup({ transparent = true, italic_comments = false })
  load()
  for _, name in ipairs({ "Normal", "NormalNC", "SignColumn", "NormalFloat", "NeoTreeNormal" }) do
    assert(hl(name).bg == nil, name .. " must be transparent")
  end
  assert(not hl("Comment").italic)
  assert(not hl("@comment").italic)

  theme.setup()
  vim.cmd.colorscheme("default")
  load()
  assert(hl("Normal").bg == 0x151E2C)
  assert(hl("Comment").italic == true)
  print("vigilia: all checks passed")
end)
if not ok then
  vim.api.nvim_err_writeln(tostring(err))
  vim.cmd("cquit 1")
else
  vim.cmd("qa!")
end
