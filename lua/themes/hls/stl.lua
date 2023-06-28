local colors = require("themes").getCurrentTheme()

return {
  StalineFolderIcon = { bg = colors.color1, fg = colors.black },
  StalineFolderSep = { bg = colors.black, fg = colors.color1 },
  StalineFolderText = { bg = colors.cursorline, fg = colors.color1 },
  StalineFilename = { bg = colors.background, fg = colors.color7 },
  StalineFilenameSep = { fg = colors.color8, bg = colors.black },
  StalineLogo = { bg = colors.black, fg = colors.color12 },
  StalineProgress = { bg = colors.cursorline, fg = colors.color2 },
  StalineProgressSep = { bg = colors.color8, fg = colors.color10 },
  StalineProgressIcon = { bg = colors.color10, fg = colors.color8 },
  StalineBranch = { bg = colors.background, fg = colors.comment },
  StalineModeSepTwo = { bg = colors.background, fg = colors.color8 },
  StalineNormalMode = { bg = colors.color4, fg = colors.black },
  StalineVisualMode = { bg = colors.color11, fg = colors.black },
  StalineCommandMode = { bg = colors.color9, fg = colors.black },
  StalineInsertMode = { bg = colors.color10, fg = colors.black },
  StalineTerminalMode = { bg = colors.color13, fg = colors.black },
  StalineNTerminalMode = { bg = colors.color13, fg = colors.black },
  StalineConfirmMode = { bg = colors.color6, fg = colors.black },
  StalineNormalModeSep = { fg = colors.color4, bg = colors.color8 },
  StalineVisualModeSep = { fg = colors.color11, bg = colors.color8 },
  StalineCommandModeSep = { fg = colors.color9, bg = colors.color8 },
  StalineInsertModeSep = { fg = colors.color10, bg = colors.color8 },
  StalineTerminalModeSep = { fg = colors.color13, bg = colors.color8 },
  StalineNTerminalModeSep = { fg = colors.color13, bg = colors.color8 },
  StalineConfirmModeSep = { fg = colors.color6, bg = colors.color8 },
  StalineEmptySpace = { bg = colors.background, fg = colors.color15 },
  StalineLspError = { bg = colors.black, fg = colors.color9 },
  StalineLspInfo = { bg = colors.black, fg = colors.color12 },
  StalineLspHints = { bg = colors.black, fg = colors.color6 },
  StalineLspWarning = { bg = colors.black, fg = colors.color11 },
  StalineLspErrorIcon = { bg = colors.black, fg = colors.color9 },
  StalineLspInfoIcon = { bg = colors.black, fg = colors.color12 },
  StalineLspHintsIcon = { bg = colors.black, fg = colors.color6 },
  StalineLspWarningIcon = { bg = colors.black, fg = colors.color11 },
  StalineLspNameNormal = { bg = colors.cursorline, fg = colors.color5 },
  StalineLspName = { bg = colors.cursorline, fg = colors.color5 },
  StalineLspIcon = { bg = colors.color13, fg = colors.black },
  StalineDiffAdd = { bg = colors.background, fg = colors.color10 },
  StalineDiffChange = { bg = colors.background, fg = colors.color11 },
  StalineDiffRemove = { bg = colors.background, fg = colors.color9 },
  StalineDefaultFile = { bg = colors.background, fg = colors.foreground },
}
