local cmd = vim.cmd
local opt = vim.opt
local autocmd = require("core.autocmds")
local diagnostic = vim.diagnostic
local g = vim.g
local changeStatus = require("staline").run
opt.hidden = true
opt.ch = 0
opt.pumheight = 2
opt.fileencoding = 'utf-8'
opt.splitbelow = true
opt.list = true
opt.splitright = true
opt.termguicolors = true
opt.conceallevel = 0
opt.showtabline = 2
opt.showmode = false
opt.backup = false
opt.number = true
opt.numberwidth = 3
opt.ruler = false
opt.writebackup = false
opt.updatetime = 300
opt.timeoutlen = 100
opt.clipboard = "unnamedplus"
opt.hlsearch = true
opt.ignorecase = true
opt.scrolloff = 0
opt.sidescrolloff = 5
opt.foldenable = false
opt.mouse = "a" -- Mouse support for noobs
opt.cursorline = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 0
opt.autoindent = true
opt.expandtab = true
opt.fillchars:append('eob: ')
opt.listchars:append "space: "
cmd('set lazyredraw')
opt.laststatus = 3 -- Global Status
diagnostic.config { signs = false } -- Removing diagnostic column
opt.updatetime = 250
opt.shadafile = "NONE"
opt.shadafile = ""
opt.formatoptions:remove { "c", "r", "o" }
opt.swapfile = false
opt.shortmess:append "sI"

-- Formatting Code on Save
autocmd.BufWritePre = {
  '*',
  function()
    for _, client in ipairs(vim.lsp.get_active_clients()) do
      if client.attached_buffers[vim.api.nvim_get_current_buf()] then
        vim.lsp.buf.format()
        return
      else
        return
      end
    end
  end
}
autocmd.CursorHold = {
  '*',
  function()
    require("staline").setup("minimal")
  end,
  once = true,
}


local has_value = function(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end
  return false
end

local available_themes = { 'minimal', 'fancy', 'monochrome' }

vim.api.nvim_create_user_command(
  'StatusStyle',
  function(opts)
    if has_value(available_themes, opts.args) then
      opt.statusline = changeStatus(opts.args)
    else
      print 'Invalid Theme'
    end
  end,
  {
    nargs = 1,
    complete = function()
      -- return completion candidates as a list-like table
      return available_themes
    end,
  }
)

-- Disabling some built in plugins
local builtins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "matchparen",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
  "archlinux",
  "fzf",
  "vimgrep"
}

for _, plugin in ipairs(builtins) do
  g["loaded_" .. plugin] = 1
end
