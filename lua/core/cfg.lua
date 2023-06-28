local M = {}
local stats = require("lazy").stats()
M.statusstyle = 'minimal'

local logos = setmetatable({
    TEXT = {
      "  ██╗  ██╗ ██████╗       ██████╗  ██████╗   ",
      "  ██║ ██╔╝██╔═══██╗      ██╔══██╗██╔═══██╗  ",
      "  █████╔╝ ██║   ██║█████╗██║  ██║██║   ██║  ",
      "  ██╔═██╗ ██║   ██║╚════╝██║  ██║██║   ██║  ",
      "  ██║  ██╗╚██████╔╝      ██████╔╝╚██████╔╝  ",
      "  ╚═╝  ╚═╝ ╚═════╝       ╚═════╝  ╚═════╝   ",
    },
    UWU = {
      '       ⡆⣸⡟⣼⣯⠏⣾⣿⢸⣿⢸⣿⣿⣿⣿⣿⣿⡟⠸⠁⢹⡿⣿⣿⢻⣿⣿⣿⣿⠄       ',
      '       ⡇⡟⣸⢟⣫⡅⣶⢆⡶⡆⣿⣿⣿⣿⣿⢿⣛⠃⠰⠆⠈⠁⠈⠙⠈⠻⣿⢹⡏⠄       ',
      '       ⣧⣱⡷⣱⠿⠟⠛⠼⣇⠇⣿⣿⣿⣿⣿⣿⠃⣰⣿⣿⡆⠄⠄⠄⠄⠄⠉⠈⠄⠄       ',
      '       ⡏⡟⢑⠃⡠⠂⠄⠄⠈⣾⢻⣿⣿⡿⡹⡳⠋⠉⠁⠉⠙⠄⢀⠄⠄⠄⠄⠄⠂⠄       ',
      '       ⡇⠁⢈⢰⡇⠄⠄⡙⠂⣿⣿⣿⣿⣱⣿⡗⠄⠄⠄⢀⡀⠄⠈⢰⠄⠄⠄⠐⠄⠄       ',
      '       ⠄⠄⠘⣿⣧⠴⣄⣡⢄⣿⣿⣿⣷⣿⣿⡇⢀⠄⠤⠈⠁⣠⣠⣸⢠⠄⠄⠄⠄⠄       ',
      '       ⢀⠄⠄⣿⣿⣷⣬⣵⣿⣿⣿⣿⣿⣿⣿⣷⣟⢷⡶⢗⡰⣿⣿⠇⠘⠄⠄⠄⠄⠄       ',
      '       ⣿⠄⠄⠘⢿⣿⣿⣿⣿⣿⣿⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢄⡆⠄⢀⣪⡆⠄⣿       ',
    },
    DRAGON = {
      '        ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆             ',
      '         ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦           ',
      '               ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄         ',
      '                 ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄       ',
      '               ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀       ',
      '        ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄      ',
      '       ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄       ',
      '      ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄      ',
      '      ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄     ',
      '            ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃         ',
    },
    UWU2 = {
      '             █████████████████              ',
      '         ████▌█████▌█ ████████▐▀██▀         ',
      '       ▄█████ █████▌ █ ▀██████▌█▄▄▀▄        ',
      '       ▌███▌█ ▐███▌▌  ▄▄ ▌█▌███▐███ ▀       ',
      '      ▐ ▐██  ▄▄▐▀█   ▐▄█▀▌█▐███▐█           ',
      '        ███ ▌▄█▌  ▀  ▀██  ▀██████▌          ',
      '         ▀█▌▀██▀ ▄         ███▐███          ',
      '          ███     ▀█▀     ▐██▐███▀▌         ',
      '          ▌█▌█▄         ▄▄████▀ ▀           ',
      '            █▀██▄▄▄ ▄▄▀▀▒█▀█                ',
    },
  },
  {
    __index = function(logos, key)
      return logos[key]
    end,
  }
)

M.dashboard = {
  header = logos.TEXT,
  buttons = {
    { "   Find File",    "LDR f f", ":Telescope find_files<cr>" },
    { "   Recent Files", "LDR f g", ":Telescope oldfiles<cr>" },
    { "   Find Word",    "LDR f r", "Telescope live_grep" },
  },
  message = {
    "[ ━━━━━━ ❖  ━━━━━━ ]",
  },
  footer = {
    "Loaded " .. stats.count .. " plugins",
  }
}

M.colorscheme = 'serenity'
return M
