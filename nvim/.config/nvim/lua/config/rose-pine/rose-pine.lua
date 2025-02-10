local M = {}
local config = require("config.rose-pine.plugins.config")

local function set_highlights()
  local utilities = require("config.rose-pine.plugins.utilities")
  local palette = require("config.rose-pine.plugins.palette")
  local styles = config.options.styles

  local groups = {}
  for group, color in pairs(config.options.groups) do
    groups[group] = utilities.parse_color(color)
  end

  local function make_border(fg)
    fg = fg or groups.border
    return {
      fg = fg,
    }
  end

  local highlights = {}
  local legacy_highlights = {
    ["@attribute.diff"] = { fg = palette.gold },
    ["@boolean"] = { link = "Boolean" },
    ["@class"] = { fg = palette.foam },
    ["@conditional"] = { link = "Conditional" },
    ["@field"] = { fg = palette.foam },
    ["@include"] = { link = "Include" },
    ["@interface"] = { fg = palette.foam },
    ["@macro"] = { link = "Macro" },
    ["@method"] = { fg = palette.rose },
    ["@namespace"] = { link = "Include" },
    ["@number"] = { link = "Number" },
    ["@parameter"] = { fg = palette.iris, italic = styles.italic },
    ["@preproc"] = { link = "PreProc" },
    ["@punctuation"] = { fg = palette.subtle },
    ["@punctuation.bracket"] = { link = "@punctuation" },
    ["@punctuation.delimiter"] = { link = "@punctuation" },
    ["@punctuation.special"] = { link = "@punctuation" },
    ["@regexp"] = { link = "String" },
    ["@repeat"] = { link = "Repeat" },
    ["@storageclass"] = { link = "StorageClass" },
    ["@symbol"] = { link = "Identifier" },
    ["@text"] = { fg = palette.text },
    ["@text.danger"] = { fg = groups.error },
    ["@text.diff.add"] = { fg = groups.git_add, blend = 20 },
    ["@text.diff.delete"] = { fg = groups.git_delete, blend = 20 },
    ["@text.emphasis"] = { italic = styles.italic },
    ["@text.environment"] = { link = "Macro" },
    ["@text.environment.name"] = { link = "Type" },
    ["@text.math"] = { link = "Special" },
    ["@text.note"] = { link = "SpecialComment" },
    ["@text.strike"] = { strikethrough = true },
    ["@text.strong"] = { bold = styles.bold },
    ["@text.title"] = { link = "Title" },
    ["@text.title.1.markdown"] = { link = "markdownH1" },
    ["@text.title.1.marker.markdown"] = { link = "markdownH1Delimiter" },
    ["@text.title.2.markdown"] = { link = "markdownH2" },
    ["@text.title.2.marker.markdown"] = { link = "markdownH2Delimiter" },
    ["@text.title.3.markdown"] = { link = "markdownH3" },
    ["@text.title.3.marker.markdown"] = { link = "markdownH3Delimiter" },
    ["@text.title.4.markdown"] = { link = "markdownH4" },
    ["@text.title.4.marker.markdown"] = { link = "markdownH4Delimiter" },
    ["@text.title.5.markdown"] = { link = "markdownH5" },
    ["@text.title.5.marker.markdown"] = { link = "markdownH5Delimiter" },
    ["@text.title.6.markdown"] = { link = "markdownH6" },
    ["@text.title.6.marker.markdown"] = { link = "markdownH6Delimiter" },
    ["@text.underline"] = { underline = true },
    ["@text.uri"] = { fg = groups.link },
    ["@text.warning"] = { fg = groups.warn },
    ["@todo"] = { link = "Todo" },

    -- lukas-reineke/indent-blankline.nvim
    IndentBlanklineChar = { fg = palette.muted, nocombine = true },
    IndentBlanklineSpaceChar = { fg = palette.muted, nocombine = true },
    IndentBlanklineSpaceCharBlankline = { fg = palette.muted, nocombine = true },
  }
  local default_highlights = {
    ColorColumn = { bg = "NONE" },
    Conceal = { bg = "NONE" },
    CurSearch = { fg = palette.base, bg = palette.text },
    Cursor = { fg = palette.text, bg = "NONE" },
    CursorColumn = { bg = "NONE" },
    -- CursorIM = {},
    CursorLine = { bg = "NONE" },
    CursorLineNr = { fg = palette.text, bold = styles.bold },
    -- DarkenedPanel = { },
    -- DarkenedStatusline = {},
    diffAdded = { link = "DiffAdd" },
    diffChanged = { link = "DiffChange" },
    diffRemoved = { link = "DiffDelete" },
    Directory = { fg = palette.foam, bold = styles.bold },
    -- EndOfBuffer = {},
    ErrorMsg = { fg = groups.error, bold = styles.bold },
    FloatBorder = make_border(),
    FloatTitle = { fg = palette.foam, bold = styles.bold },
    FoldColumn = { fg = palette.muted },
    Folded = { fg = palette.text, bg = "NONE" },
    IncSearch = { link = "CurSearch" },
    LineNr = { fg = palette.muted },
    MatchParen = { fg = palette.pine, blend = 25 },
    ModeMsg = { fg = palette.subtle },
    MoreMsg = { fg = palette.iris },
    NonText = { fg = palette.muted },
    Normal = { fg = palette.text, bg = "NONE" },
    NormalFloat = { bg = "NONE" },
    NormalNC = { fg = palette.text },
    NvimInternalError = { link = "ErrorMsg" },
    Pmenu = { fg = palette.subtle, bg = "NONE" },
    PmenuExtra = { fg = palette.muted, bg = "NONE" },
    PmenuExtraSel = { fg = palette.subtle, bg = "NONE" },
    PmenuKind = { fg = palette.foam, bg = "NONE" },
    PmenuKindSel = { fg = palette.subtle, bg = "NONE" },
    PmenuSbar = { bg = "NONE" },
    PmenuSel = { fg = palette.text, bg = "NONE" },
    PmenuThumb = { bg = "NONE" },
    Question = { fg = palette.gold },
    -- QuickFixLink = {},
    -- RedrawDebugNormal = {},
    RedrawDebugClear = { fg = palette.base, bg = "NONE" },
    RedrawDebugComposed = { fg = palette.base, bg = "NONE" },
    RedrawDebugRecompose = { fg = palette.base, bg = "NONE" },
    Search = { fg = palette.text, bg = palette.muted },
    SignColumn = { fg = palette.text, bg = "NONE" },
    SpecialKey = { fg = palette.foam },
    SpellBad = { sp = palette.subtle, undercurl = true },
    SpellCap = { sp = palette.subtle, undercurl = true },
    SpellLocal = { sp = palette.subtle, undercurl = true },
    SpellRare = { sp = palette.subtle, undercurl = true },
    StatusLine = { fg = palette.subtle, bg = "NONE" },
    StatusLineNC = { fg = palette.muted },
    StatusLineTerm = { fg = palette.base, bg = "NONE" },
    StatusLineTermNC = { fg = palette.base },
    Substitute = { link = "IncSearch" },
    TabLine = { fg = palette.subtle, bg = "NONE" },
    TabLineFill = { bg = "NONE" },
    TabLineSel = { fg = palette.text, bold = styles.bold },
    Title = { fg = palette.foam, bold = styles.bold },
    VertSplit = { fg = groups.border },
    -- VisualNOS = {},
    WarningMsg = { fg = groups.warn, bold = styles.bold },
    -- Whitespace = {},
    WildMenu = { link = "IncSearch" },
    WinBar = { fg = palette.subtle, bg = "NONE" },
    WinBarNC = { fg = palette.muted },
    WinSeparator = { fg = groups.border },

    DiagnosticError = { fg = groups.error },
    DiagnosticHint = { fg = groups.hint },
    DiagnosticInfo = { fg = groups.info },
    DiagnosticOk = { fg = groups.ok },
    DiagnosticWarn = { fg = groups.warn },
    DiagnosticDefaultError = { link = "DiagnosticError" },
    DiagnosticDefaultHint = { link = "DiagnosticHint" },
    DiagnosticDefaultInfo = { link = "DiagnosticInfo" },
    DiagnosticDefaultOk = { link = "DiagnosticOk" },
    DiagnosticDefaultWarn = { link = "DiagnosticWarn" },
    DiagnosticFloatingError = { link = "DiagnosticError" },
    DiagnosticFloatingHint = { link = "DiagnosticHint" },
    DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
    DiagnosticFloatingOk = { link = "DiagnosticOk" },
    DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
    DiagnosticSignError = { link = "DiagnosticError" },
    DiagnosticSignHint = { link = "DiagnosticHint" },
    DiagnosticSignInfo = { link = "DiagnosticInfo" },
    DiagnosticSignOk = { link = "DiagnosticOk" },
    DiagnosticSignWarn = { link = "DiagnosticWarn" },
    DiagnosticUnderlineError = { sp = groups.error, undercurl = true },
    DiagnosticUnderlineHint = { sp = groups.hint, undercurl = true },
    DiagnosticUnderlineInfo = { sp = groups.info, undercurl = true },
    DiagnosticUnderlineOk = { sp = groups.ok, undercurl = true },
    DiagnosticUnderlineWarn = { sp = groups.warn, undercurl = true },
    DiagnosticVirtualTextError = { fg = groups.error },
    DiagnosticVirtualTextHint = { fg = groups.hint },
    DiagnosticVirtualTextInfo = { fg = groups.info },
    DiagnosticVirtualTextOk = { fg = groups.ok },
    DiagnosticVirtualTextWarn = { fg = groups.warn },

    Boolean = { fg = palette.rose },
    Character = { fg = palette.gold },
    Comment = { fg = palette.subtle, italic = styles.italic },
    Conditional = { fg = palette.pine },
    Constant = { fg = palette.gold },
    Debug = { fg = palette.rose },
    Define = { fg = palette.iris },
    Delimiter = { fg = palette.subtle },
    Error = { fg = palette.love },
    Exception = { fg = palette.pine },
    Float = { fg = palette.gold },
    Function = { fg = palette.rose },
    Identifier = { fg = palette.text },
    Include = { fg = palette.pine },
    Keyword = { fg = palette.pine },
    Label = { fg = palette.foam },
    LspCodeLens = { fg = palette.subtle },
    LspCodeLensSeparator = { fg = palette.muted },
    LspInlayHint = { fg = palette.muted },
    LspReferenceRead = { bg = "NONE" },
    LspReferenceText = { bg = "NONE" },
    LspReferenceWrite = { bg = "NONE" },
    Macro = { fg = palette.iris },
    Number = { fg = palette.gold },
    Operator = { fg = palette.subtle },
    PreCondit = { fg = palette.iris },
    PreProc = { link = "PreCondit" },
    Repeat = { fg = palette.pine },
    Special = { fg = palette.foam },
    SpecialChar = { link = "Special" },
    SpecialComment = { fg = palette.iris },
    Statement = { fg = palette.pine, bold = styles.bold },
    StorageClass = { fg = palette.foam },
    String = { fg = palette.gold },
    Structure = { fg = palette.foam },
    Tag = { fg = palette.foam },
    Todo = { fg = palette.rose },
    Type = { fg = palette.foam },
    TypeDef = { link = "Type" },
    Underlined = { fg = palette.iris, underline = true },

    healthError = { fg = groups.error },
    healthSuccess = { fg = groups.info },
    healthWarning = { fg = groups.warn },

    htmlArg = { fg = palette.iris },
    htmlBold = { bold = styles.bold },
    htmlEndTag = { fg = palette.subtle },
    htmlH1 = { link = "markdownH1" },
    htmlH2 = { link = "markdownH2" },
    htmlH3 = { link = "markdownH3" },
    htmlH4 = { link = "markdownH4" },
    htmlH5 = { link = "markdownH5" },
    htmlItalic = { italic = styles.italic },
    htmlLink = { link = "markdownUrl" },
    htmlTag = { fg = palette.subtle },
    htmlTagN = { fg = palette.text },
    htmlTagName = { fg = palette.foam },

    markdownDelimiter = { fg = palette.subtle },
    markdownH1 = { fg = groups.h1, bold = styles.bold },
    markdownH1Delimiter = { link = "markdownH1" },
    markdownH2 = { fg = groups.h2, bold = styles.bold },
    markdownH2Delimiter = { link = "markdownH2" },
    markdownH3 = { fg = groups.h3, bold = styles.bold },
    markdownH3Delimiter = { link = "markdownH3" },
    markdownH4 = { fg = groups.h4, bold = styles.bold },
    markdownH4Delimiter = { link = "markdownH4" },
    markdownH5 = { fg = groups.h5, bold = styles.bold },
    markdownH5Delimiter = { link = "markdownH5" },
    markdownH6 = { fg = groups.h6, bold = styles.bold },
    markdownH6Delimiter = { link = "markdownH6" },
    markdownLinkText = { link = "markdownUrl" },
    markdownUrl = { fg = groups.link, sp = groups.link, underline = true },

    mkdCode = { fg = palette.foam, italic = styles.italic },
    mkdCodeDelimiter = { fg = palette.rose },
    mkdCodeEnd = { fg = palette.foam },
    mkdCodeStart = { fg = palette.foam },
    mkdFootnotes = { fg = palette.foam },
    mkdID = { fg = palette.foam, underline = true },
    mkdInlineURL = { link = "markdownUrl" },
    mkdLink = { link = "markdownUrl" },
    mkdLinkDef = { link = "markdownUrl" },
    mkdListItemLine = { fg = palette.text },
    mkdRule = { fg = palette.subtle },
    mkdURL = { link = "markdownUrl" },

    --- Identifiers
    ["@variable"] = { fg = palette.text, italic = styles.italic },
    ["@variable.builtin"] = { fg = palette.love, bold = styles.bold },
    ["@variable.parameter"] = { fg = palette.iris, italic = styles.italic },
    ["@variable.member"] = { fg = palette.foam },

    ["@constant"] = { fg = palette.gold },
    ["@constant.builtin"] = { fg = palette.gold, bold = styles.bold },
    ["@constant.macro"] = { fg = palette.gold },

    ["@module"] = { fg = palette.text },
    ["@module.builtin"] = { fg = palette.text, bold = styles.bold },
    ["@label"] = { link = "Label" },

    --- Literals
    ["@string"] = { link = "String" },
    -- ["@string.documentation"] = {},
    ["@string.regexp"] = { fg = palette.iris },
    ["@string.escape"] = { fg = palette.pine },
    ["@string.special"] = { link = "String" },
    ["@string.special.symbol"] = { link = "Identifier" },
    ["@string.special.url"] = { fg = groups.link },
    -- ["@string.special.path"] = {},

    ["@character"] = { link = "Character" },
    ["@character.special"] = { link = "Character" },

    ["@boolean"] = { link = "Boolean" },
    ["@number"] = { link = "Number" },
    ["@number.float"] = { link = "Number" },
    ["@float"] = { link = "Number" },

    --- Types
    ["@type"] = { fg = palette.foam },
    ["@type.builtin"] = { fg = palette.foam, bold = styles.bold },
    -- ["@type.definition"] = {},
    -- ["@type.qualifier"] = {},

    -- ["@attribute"] = {},
    ["@property"] = { fg = palette.foam, italic = styles.italic },

    --- Functions
    ["@function"] = { fg = palette.rose },
    ["@function.builtin"] = { fg = palette.rose, bold = styles.bold },
    -- ["@function.call"] = {},
    ["@function.macro"] = { link = "Function" },
    ["@function.method"] = { fg = palette.rose },
    ["@function.method.call"] = { fg = palette.iris },

    ["@constructor"] = { fg = palette.foam },
    ["@operator"] = { link = "Operator" },

    --- Keywords
    ["@keyword"] = { link = "Keyword" },
    -- ["@keyword.coroutine"] = {},
    -- ["@keyword.function"] = {},
    ["@keyword.operator"] = { fg = palette.subtle },
    ["@keyword.import"] = { fg = palette.pine },
    ["@keyword.storage"] = { fg = palette.foam },
    ["@keyword.repeat"] = { fg = palette.pine },
    ["@keyword.return"] = { fg = palette.pine },
    ["@keyword.debug"] = { fg = palette.rose },
    ["@keyword.exception"] = { fg = palette.pine },
    ["@keyword.conditional"] = { fg = palette.pine },
    ["@keyword.conditional.ternary"] = { fg = palette.pine },
    ["@keyword.directive"] = { fg = palette.iris },
    ["@keyword.directive.define"] = { fg = palette.iris },

    --- Punctuation
    ["@punctuation.delimiter"] = { fg = palette.subtle },
    ["@punctuation.bracket"] = { fg = palette.subtle },
    ["@punctuation.special"] = { fg = palette.subtle },

    --- Comments
    ["@comment"] = { link = "Comment" },
    -- ["@comment.documentation"] = {},

    ["@comment.error"] = { fg = groups.error },
    ["@comment.warning"] = { fg = groups.warn },
    ["@comment.todo"] = { fg = groups.todo },
    ["@comment.hint"] = { fg = groups.hint },
    ["@comment.info"] = { fg = groups.info },
    ["@comment.note"] = { fg = groups.note },

    --- Markup
    ["@markup.strong"] = { bold = styles.bold },
    ["@markup.italic"] = { italic = styles.italic },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },

    ["@markup.heading"] = { fg = palette.foam, bold = styles.bold },

    ["@markup.quote"] = { fg = palette.text },
    ["@markup.math"] = { link = "Special" },
    ["@markup.environment"] = { link = "Macro" },
    ["@markup.environment.name"] = { link = "@type" },

    -- ["@markup.link"] = {},
    ["@markup.link.markdown_inline"] = { fg = palette.subtle },
    ["@markup.link.label.markdown_inline"] = { fg = palette.foam },
    ["@markup.link.url"] = { fg = groups.link },

    -- ["@markup.raw"] = { bg = "NONE" },
    -- ["@markup.raw.block"] = { bg = "NONE" },
    ["@markup.raw.delimiter.markdown"] = { fg = palette.subtle },

    ["@markup.list"] = { fg = palette.pine },
    ["@markup.list.checked"] = { fg = palette.foam },
    ["@markup.list.unchecked"] = { fg = palette.text },

    -- Markdown headings
    ["@markup.heading.1.markdown"] = { link = "markdownH1" },
    ["@markup.heading.2.markdown"] = { link = "markdownH2" },
    ["@markup.heading.3.markdown"] = { link = "markdownH3" },
    ["@markup.heading.4.markdown"] = { link = "markdownH4" },
    ["@markup.heading.5.markdown"] = { link = "markdownH5" },
    ["@markup.heading.6.markdown"] = { link = "markdownH6" },
    ["@markup.heading.1.marker.markdown"] = { link = "markdownH1Delimiter" },
    ["@markup.heading.2.marker.markdown"] = { link = "markdownH2Delimiter" },
    ["@markup.heading.3.marker.markdown"] = { link = "markdownH3Delimiter" },
    ["@markup.heading.4.marker.markdown"] = { link = "markdownH4Delimiter" },
    ["@markup.heading.5.marker.markdown"] = { link = "markdownH5Delimiter" },
    ["@markup.heading.6.marker.markdown"] = { link = "markdownH6Delimiter" },

    ["@diff.plus"] = { fg = groups.git_add },
    ["@diff.minus"] = { fg = groups.git_delete },

    ["@tag"] = { link = "Tag" },
    ["@tag.attribute"] = { fg = palette.iris },
    ["@tag.delimiter"] = { fg = palette.subtle },

    --- Non-highlighting captures
    -- ["@none"] = {},
    ["@conceal"] = { link = "Conceal" },
    ["@conceal.markdown"] = { fg = palette.subtle },

    -- ["@spell"] = {},
    -- ["@nospell"] = {},

    --- Semantic
    ["@lsp.type.comment"] = {},
    ["@lsp.type.comment.c"] = { link = "@comment" },
    ["@lsp.type.comment.cpp"] = { link = "@comment" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.interface"] = { link = "@interface" },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.namespace.python"] = { link = "@variable" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.variable"] = {}, -- defer to treesitter for regular variables
    ["@lsp.type.variable.svelte"] = { link = "@variable" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.variable.constant"] = { link = "@constant" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },

    --- Plugins
    -- romgrk/barbar.nvim
    BufferCurrent = { fg = palette.text, bg = "NONE" },
    BufferCurrentIndex = { fg = palette.text, bg = "NONE" },
    BufferCurrentMod = { fg = palette.foam, bg = "NONE" },
    BufferCurrentSign = { fg = palette.subtle, bg = "NONE" },
    BufferCurrentTarget = { fg = palette.gold, bg = "NONE" },
    BufferInactive = { fg = palette.subtle },
    BufferInactiveIndex = { fg = palette.subtle },
    BufferInactiveMod = { fg = palette.foam },
    BufferInactiveSign = { fg = palette.muted },
    BufferInactiveTarget = { fg = palette.gold },
    BufferTabpageFill = { fg = "NONE", bg = "NONE" },
    BufferVisible = { fg = palette.subtle },
    BufferVisibleIndex = { fg = palette.subtle },
    BufferVisibleMod = { fg = palette.foam },
    BufferVisibleSign = { fg = palette.muted },
    BufferVisibleTarget = { fg = palette.gold },

    -- lewis6991/gitsigns.nvim
    GitSignsAdd = { link = "SignAdd" },
    GitSignsChange = { link = "SignChange" },
    GitSignsDelete = { link = "SignDelete" },
    SignAdd = { fg = groups.git_add, bg = "NONE" },
    SignChange = { fg = groups.git_change, bg = "NONE" },
    SignDelete = { fg = groups.git_delete, bg = "NONE" },

    -- mvllow/modes.nvim
    ModesCopy = { bg = "NONE" },
    ModesDelete = { bg = "NONE" },
    ModesInsert = { bg = "NONE" },
    ModesReplace = { bg = "NONE" },
    ModesVisual = { bg = "NONE" },

    -- kyazdani42/nvim-tree.lua
    NvimTreeEmptyFolderName = { fg = palette.muted },
    NvimTreeFileDeleted = { fg = groups.git_delete },
    NvimTreeFileDirty = { fg = groups.git_dirty },
    NvimTreeFileMerge = { fg = groups.git_merge },
    NvimTreeFileNew = { fg = palette.foam },
    NvimTreeFileRenamed = { fg = groups.git_rename },
    NvimTreeFileStaged = { fg = groups.git_stage },
    NvimTreeFolderIcon = { fg = palette.subtle },
    NvimTreeFolderName = { fg = palette.foam },
    NvimTreeGitDeleted = { fg = groups.git_delete },
    NvimTreeGitDirty = { fg = groups.git_dirty },
    NvimTreeGitIgnored = { fg = groups.git_ignore },
    NvimTreeGitMerge = { fg = groups.git_merge },
    NvimTreeGitNew = { fg = groups.git_add },
    NvimTreeGitRenamed = { fg = groups.git_rename },
    NvimTreeGitStaged = { fg = groups.git_stage },
    NvimTreeImageFile = { fg = palette.text },
    NvimTreeNormal = { link = "Normal" },
    NvimTreeOpenedFile = { fg = palette.text, bg = "NONE" },
    NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },
    NvimTreeRootFolder = { fg = palette.foam, bold = styles.bold },
    NvimTreeSpecialFile = { link = "NvimTreeNormal" },
    NvimTreeWindowPicker = { link = "StatusLineTerm" },

    -- nvim-neotest/neotest
    NeotestAdapterName = { fg = palette.iris },
    NeotestBorder = { fg = palette.highlight_med },
    NeotestDir = { fg = palette.foam },
    NeotestExpandMarker = { fg = palette.highlight_med },
    NeotestFailed = { fg = palette.love },
    NeotestFile = { fg = palette.text },
    NeotestFocused = { fg = palette.gold, bg = "NONE" },
    NeotestIndent = { fg = palette.highlight_med },
    NeotestMarked = { fg = palette.rose, bold = styles.bold },
    NeotestNamespace = { fg = palette.gold },
    NeotestPassed = { fg = palette.pine },
    NeotestRunning = { fg = palette.gold },
    NeotestWinSelect = { fg = palette.muted },
    NeotestSkipped = { fg = palette.subtle },
    NeotestTarget = { fg = palette.love },
    NeotestTest = { fg = palette.gold },
    NeotestUnknown = { fg = palette.subtle },
    NeotestWatching = { fg = palette.iris },

    -- nvim-neo-tree/neo-tree.nvim
    NeoTreeGitAdded = { fg = groups.git_add },
    NeoTreeGitConflict = { fg = groups.git_merge },
    NeoTreeGitDeleted = { fg = groups.git_delete },
    NeoTreeGitIgnored = { fg = groups.git_ignore },
    NeoTreeGitModified = { fg = groups.git_dirty },
    NeoTreeGitRenamed = { fg = groups.git_rename },
    NeoTreeGitUntracked = { fg = groups.git_untracked },
    NeoTreeTabActive = { fg = palette.text, bg = "NONE" },
    NeoTreeTabInactive = { fg = palette.subtle },
    NeoTreeTabSeparatorActive = { link = "WinSeparator" },
    NeoTreeTabSeparatorInactive = { link = "WinSeparator" },
    NeoTreeTitleBar = { link = "StatusLineTerm" },

    -- folke/flash.nvim
    FlashLabel = { fg = palette.base, bg = "NONE" },

    -- folke/which-key.nvim
    WhichKey = { fg = palette.iris },
    WhichKeyBorder = make_border(),
    WhichKeyDesc = { fg = palette.gold },
    WhichKeyFloat = { bg = "NONE" },
    WhichKeyGroup = { fg = palette.foam },
    WhichKeyIcon = { fg = palette.pine },
    WhichKeyIconAzure = { fg = palette.pine },
    WhichKeyIconBlue = { fg = palette.pine },
    WhichKeyIconCyan = { fg = palette.foam },
    WhichKeyIconGreen = { fg = palette.leaf },
    WhichKeyIconGrey = { fg = palette.subtle },
    WhichKeyIconOrange = { fg = palette.rose },
    WhichKeyIconPurple = { fg = palette.iris },
    WhichKeyIconRed = { fg = palette.love },
    WhichKeyIconYellow = { fg = palette.gold },
    WhichKeyNormal = { link = "NormalFloat" },
    WhichKeySeparator = { fg = palette.subtle },
    WhichKeyTitle = { link = "FloatTitle" },
    WhichKeyValue = { fg = palette.rose },

    -- lukas-reineke/indent-blankline.nvim
    IblIndent = { fg = palette.overlay },
    IblScope = { fg = palette.foam },
    IblWhitespace = { fg = palette.overlay },

    -- hrsh7th/nvim-cmp
    CmpItemAbbr = { fg = palette.subtle },
    CmpItemAbbrDeprecated = { fg = palette.subtle, strikethrough = true },
    CmpItemAbbrMatch = { fg = palette.text, bold = styles.bold },
    CmpItemAbbrMatchFuzzy = { fg = palette.text, bold = styles.bold },
    CmpItemKind = { fg = palette.subtle },
    CmpItemKindClass = { link = "StorageClass" },
    CmpItemKindFunction = { link = "Function" },
    CmpItemKindInterface = { link = "Type" },
    CmpItemKindMethod = { link = "PreProc" },
    CmpItemKindSnippet = { link = "String" },
    CmpItemKindVariable = { link = "Identifier" },

    -- NeogitOrg/neogit
    -- https://github.com/NeogitOrg/neogit/blob/master/lua/neogit/lib/hl.lua#L109-L198
    NeogitChangeAdded = { fg = groups.git_add, bold = styles.bold, italic = styles.italic },
    NeogitChangeBothModified = { fg = groups.git_change, bold = styles.bold, italic = styles.italic },
    NeogitChangeCopied = { fg = groups.git_untracked, bold = styles.bold, italic = styles.italic },
    NeogitChangeDeleted = { fg = groups.git_delete, bold = styles.bold, italic = styles.italic },
    NeogitChangeModified = { fg = groups.git_change, bold = styles.bold, italic = styles.italic },
    NeogitChangeNewFile = { fg = groups.git_stage, bold = styles.bold, italic = styles.italic },
    NeogitChangeRenamed = { fg = groups.git_rename, bold = styles.bold, italic = styles.italic },
    NeogitChangeUpdated = { fg = groups.git_change, bold = styles.bold, italic = styles.italic },
    NeogitDiffAddHighlight = { link = "DiffAdd" },
    NeogitDiffContextHighlight = { bg = "NONE" },
    NeogitDiffDeleteHighlight = { link = "DiffDelete" },
    NeogitFilePath = { fg = palette.foam, italic = styles.italic },
    NeogitHunkHeader = { bg = "NONE" },
    NeogitHunkHeaderHighlight = { bg = "NONE" },

    -- vimwiki/vimwiki
    VimwikiHR = { fg = palette.subtle },
    VimwikiHeader1 = { link = "markdownH1" },
    VimwikiHeader2 = { link = "markdownH2" },
    VimwikiHeader3 = { link = "markdownH3" },
    VimwikiHeader4 = { link = "markdownH4" },
    VimwikiHeader5 = { link = "markdownH5" },
    VimwikiHeader6 = { link = "markdownH6" },
    VimwikiHeaderChar = { fg = palette.subtle },
    VimwikiLink = { link = "markdownUrl" },
    VimwikiList = { fg = palette.iris },
    VimwikiNoExistsLink = { fg = palette.love },

    -- nvim-neorg/neorg
    NeorgHeading1Prefix = { link = "markdownH1Delimiter" },
    NeorgHeading1Title = { link = "markdownH1" },
    NeorgHeading2Prefix = { link = "markdownH2Delimiter" },
    NeorgHeading2Title = { link = "markdownH2" },
    NeorgHeading3Prefix = { link = "markdownH3Delimiter" },
    NeorgHeading3Title = { link = "markdownH3" },
    NeorgHeading4Prefix = { link = "markdownH4Delimiter" },
    NeorgHeading4Title = { link = "markdownH4" },
    NeorgHeading5Prefix = { link = "markdownH5Delimiter" },
    NeorgHeading5Title = { link = "markdownH5" },
    NeorgHeading6Prefix = { link = "markdownH6Delimiter" },
    NeorgHeading6Title = { link = "markdownH6" },
    NeorgMarkerTitle = { fg = palette.foam, bold = styles.bold },

    -- tami5/lspsaga.nvim (fork of glepnir/lspsaga.nvim)
    DefinitionCount = { fg = palette.rose },
    DefinitionIcon = { fg = palette.rose },
    DefinitionPreviewTitle = { fg = palette.rose, bold = styles.bold },
    LspFloatWinBorder = make_border(),
    LspFloatWinNormal = { bg = "NONE" },
    LspSagaAutoPreview = { fg = palette.subtle },
    LspSagaCodeActionBorder = make_border(palette.rose),
    LspSagaCodeActionContent = { fg = palette.foam },
    LspSagaCodeActionTitle = { fg = palette.gold, bold = styles.bold },
    LspSagaCodeActionTruncateLine = { link = "LspSagaCodeActionBorder" },
    LspSagaDefPreviewBorder = make_border(),
    LspSagaDiagnosticBorder = make_border(palette.gold),
    LspSagaDiagnosticHeader = { fg = palette.foam, bold = styles.bold },
    LspSagaDiagnosticTruncateLine = { link = "LspSagaDiagnosticBorder" },
    LspSagaDocTruncateLine = { link = "LspSagaHoverBorder" },
    LspSagaFinderSelection = { fg = palette.gold },
    LspSagaHoverBorder = { link = "LspFloatWinBorder" },
    LspSagaLspFinderBorder = { link = "LspFloatWinBorder" },
    LspSagaRenameBorder = make_border(palette.pine),
    LspSagaRenamePromptPrefix = { fg = palette.love },
    LspSagaShTruncateLine = { link = "LspSagaSignatureHelpBorder" },
    LspSagaSignatureHelpBorder = make_border(palette.foam),
    ReferencesCount = { fg = palette.rose },
    ReferencesIcon = { fg = palette.rose },
    SagaShadow = { bg = "NONE" },
    TargetWord = { fg = palette.iris },

    -- ray-x/lsp_signature.nvim
    LspSignatureActiveParameter = { bg = "NONE" },

    -- rlane/pounce.nvim
    PounceAccept = { fg = palette.love },
    PounceAcceptBest = { fg = palette.gold },
    PounceGap = { link = "Search" },
    PounceMatch = { link = "Search" },

    -- ggandor/leap.nvim
    LeapLabelPrimary = { link = "IncSearch" },
    LeapLabelSecondary = { link = "StatusLineTerm" },
    LeapMatch = { link = "MatchParen" },

    -- phaazon/hop.nvim
    -- smoka7/hop.nvim
    HopNextKey = { fg = palette.love },
    HopNextKey1 = { fg = palette.foam },
    HopNextKey2 = { fg = palette.pine },
    HopUnmatched = { fg = palette.muted },

    -- ibhagwan/fzf-lua
    FzfLuaBorder = make_border(),
    FzfLuaBufFlagAlt = { fg = palette.subtle },
    FzfLuaBufFlagCur = { fg = palette.subtle },
    FzfLuaCursorLine = { fg = palette.text, bg = "NONE" },
    FzfLuaFilePart = { fg = palette.text },
    FzfLuaHeaderBind = { fg = palette.rose },
    FzfLuaHeaderText = { fg = palette.love },
    FzfLuaNormal = { link = "NormalFloat" },
    FzfLuaTitle = { link = "FloatTitle" },

    -- rcarriga/nvim-notify
    NotifyBackground = { link = "NormalFloat" },
    NotifyDEBUGBody = { link = "NormalFloat" },
    NotifyDEBUGBorder = make_border(),
    NotifyDEBUGIcon = { link = "NotifyDEBUGTitle" },
    NotifyDEBUGTitle = { fg = palette.muted },
    NotifyERRORBody = { link = "NormalFloat" },
    NotifyERRORBorder = make_border(groups.error),
    NotifyERRORIcon = { link = "NotifyERRORTitle" },
    NotifyERRORTitle = { fg = groups.error },
    NotifyINFOBody = { link = "NormalFloat" },
    NotifyINFOBorder = make_border(groups.info),
    NotifyINFOIcon = { link = "NotifyINFOTitle" },
    NotifyINFOTitle = { fg = groups.info },
    NotifyTRACEBody = { link = "NormalFloat" },
    NotifyTRACEBorder = make_border(palette.iris),
    NotifyTRACEIcon = { link = "NotifyTRACETitle" },
    NotifyTRACETitle = { fg = palette.iris },
    NotifyWARNBody = { link = "NormalFloat" },
    NotifyWARNBorder = make_border(groups.warn),
    NotifyWARNIcon = { link = "NotifyWARNTitle" },
    NotifyWARNTitle = { fg = groups.warn },

    -- rcarriga/nvim-dap-ui
    DapUIBreakpointsCurrentLine = { fg = palette.gold, bold = styles.bold },
    DapUIBreakpointsDisabledLine = { fg = palette.muted },
    DapUIBreakpointsInfo = { link = "DapUIThread" },
    DapUIBreakpointsLine = { link = "DapUIBreakpointsPath" },
    DapUIBreakpointsPath = { fg = palette.foam },
    DapUIDecoration = { link = "DapUIBreakpointsPath" },
    DapUIFloatBorder = make_border(),
    DapUIFrameName = { fg = palette.text },
    DapUILineNumber = { link = "DapUIBreakpointsPath" },
    DapUIModifiedValue = { fg = palette.foam, bold = styles.bold },
    DapUIScope = { link = "DapUIBreakpointsPath" },
    DapUISource = { fg = palette.iris },
    DapUIStoppedThread = { link = "DapUIBreakpointsPath" },
    DapUIThread = { fg = palette.gold },
    DapUIValue = { fg = palette.text },
    DapUIVariable = { fg = palette.text },
    DapUIWatchesEmpty = { fg = palette.love },
    DapUIWatchesError = { link = "DapUIWatchesEmpty" },
    DapUIWatchesValue = { link = "DapUIThread" },

    -- glepnir/dashboard-nvim
    DashboardCenter = { fg = palette.gold },
    DashboardFooter = { fg = palette.iris },
    DashboardHeader = { fg = palette.pine },
    DashboardShortcut = { fg = palette.love },

    -- SmiteshP/nvim-navic
    NavicIconsArray = { fg = palette.gold },
    NavicIconsBoolean = { fg = palette.rose },
    NavicIconsClass = { fg = palette.foam },
    NavicIconsConstant = { fg = palette.gold },
    NavicIconsConstructor = { fg = palette.gold },
    NavicIconsEnum = { fg = palette.gold },
    NavicIconsEnumMember = { fg = palette.foam },
    NavicIconsEvent = { fg = palette.gold },
    NavicIconsField = { fg = palette.foam },
    NavicIconsFile = { fg = palette.muted },
    NavicIconsFunction = { fg = palette.pine },
    NavicIconsInterface = { fg = palette.foam },
    NavicIconsKey = { fg = palette.iris },
    NavicIconsKeyword = { fg = palette.pine },
    NavicIconsMethod = { fg = palette.iris },
    NavicIconsModule = { fg = palette.rose },
    NavicIconsNamespace = { fg = palette.muted },
    NavicIconsNull = { fg = palette.love },
    NavicIconsNumber = { fg = palette.gold },
    NavicIconsObject = { fg = palette.gold },
    NavicIconsOperator = { fg = palette.subtle },
    NavicIconsPackage = { fg = palette.muted },
    NavicIconsProperty = { fg = palette.foam },
    NavicIconsString = { fg = palette.gold },
    NavicIconsStruct = { fg = palette.foam },
    NavicIconsTypeParameter = { fg = palette.foam },
    NavicIconsVariable = { fg = palette.text },
    NavicSeparator = { fg = palette.subtle },
    NavicText = { fg = palette.subtle },

    -- folke/noice.nvim
    NoiceCursor = { fg = palette.highlight_high, bg = "NONE" },

    -- folke/trouble.nvim
    TroubleText = { fg = palette.subtle },
    TroubleCount = { fg = palette.iris, bg = "NONE" },
    TroubleNormal = { fg = palette.text, bg = "NONE" },

    -- echasnovski/mini.nvim
    MiniAnimateCursor = { reverse = true, nocombine = true },
    MiniAnimateNormalFloat = { link = "NormalFloat" },

    MiniClueBorder = { link = "FloatBorder" },
    MiniClueDescGroup = { link = "DiagnosticFloatingWarn" },
    MiniClueDescSingle = { link = "NormalFloat" },
    MiniClueNextKey = { link = "DiagnosticFloatingHint" },
    MiniClueNextKeyWithPostkeys = { link = "DiagnosticFloatingError" },
    MiniClueSeparator = { link = "DiagnosticFloatingInfo" },
    MiniClueTitle = { bold = styles.bold },

    MiniCompletionActiveParameter = { underline = true },

    MiniCursorword = { underline = true },
    MiniCursorwordCurrent = { underline = true },

    MiniDepsChangeAdded = { fg = groups.git_add },
    MiniDepsChangeRemoved = { fg = groups.git_delete },
    MiniDepsHint = { link = "DiagnosticHint" },
    MiniDepsInfo = { link = "DiagnosticInfo" },
    MiniDepsMsgBreaking = { link = "DiagnosticWarn" },
    MiniDepsPlaceholder = { link = "Comment" },
    MiniDepsTitle = { link = "Title" },
    MiniDepsTitleError = { link = "DiffDelete" },
    MiniDepsTitleSame = { link = "DiffText" },
    MiniDepsTitleUpdate = { link = "DiffAdd" },

    MiniDiffOverAdd = { fg = groups.git_add },
    MiniDiffOverChange = { fg = groups.git_change },
    MiniDiffOverContext = { bg = "NONE" },
    MiniDiffOverDelete = { fg = groups.git_delete },
    MiniDiffSignAdd = { fg = groups.git_add },
    MiniDiffSignChange = { fg = groups.git_change },
    MiniDiffSignDelete = { fg = groups.git_delete },

    MiniFilesBorder = { link = "FloatBorder" },
    MiniFilesBorderModified = { link = "DiagnosticFloatingWarn" },
    MiniFilesCursorLine = { link = "CursorLine" },
    MiniFilesDirectory = { link = "Directory" },
    MiniFilesFile = { fg = palette.text },
    MiniFilesNormal = { link = "NormalFloat" },
    MiniFilesTitle = { link = "FloatTitle" },
    MiniFilesTitleFocused = { fg = palette.rose, bold = styles.bold },

    MiniHipatternsFixme = { fg = palette.base, bold = styles.bold },
    MiniHipatternsHack = { fg = palette.base, bold = styles.bold },
    MiniHipatternsNote = { fg = palette.base, bold = styles.bold },
    MiniHipatternsTodo = { fg = palette.base, bold = styles.bold },

    MiniIconsAzure = { fg = palette.foam },
    MiniIconsBlue = { fg = palette.pine },
    MiniIconsCyan = { fg = palette.foam },
    MiniIconsGreen = { fg = palette.leaf },
    MiniIconsGrey = { fg = palette.subtle },
    MiniIconsOrange = { fg = palette.rose },
    MiniIconsPurple = { fg = palette.iris },
    MiniIconsRed = { fg = palette.love },
    MiniIconsYellow = { fg = palette.gold },

    MiniIndentscopeSymbol = { fg = palette.muted },
    MiniIndentscopeSymbolOff = { fg = palette.gold },

    MiniJump = { sp = palette.gold, undercurl = true },

    MiniJump2dDim = { fg = palette.subtle },
    MiniJump2dSpot = { fg = palette.gold, bold = styles.bold, nocombine = true },
    MiniJump2dSpotAhead = { fg = palette.foam, nocombine = true },
    MiniJump2dSpotUnique = { fg = palette.rose, bold = styles.bold, nocombine = true },

    MiniMapNormal = { link = "NormalFloat" },
    MiniMapSymbolCount = { link = "Special" },
    MiniMapSymbolLine = { link = "Title" },
    MiniMapSymbolView = { link = "Delimiter" },

    MiniNotifyBorder = { link = "FloatBorder" },
    MiniNotifyNormal = { link = "NormalFloat" },
    MiniNotifyTitle = { link = "FloatTitle" },

    MiniOperatorsExchangeFrom = { link = "IncSearch" },

    MiniPickBorder = { link = "FloatBorder" },
    MiniPickBorderBusy = { link = "DiagnosticFloatingWarn" },
    MiniPickBorderText = { bg = "NONE" },
    MiniPickIconDirectory = { link = "Directory" },
    MiniPickIconFile = { link = "MiniPickNormal" },
    MiniPickHeader = { link = "DiagnosticFloatingHint" },
    MiniPickMatchCurrent = { link = "CursorLine" },
    MiniPickMatchMarked = { link = "Visual" },
    MiniPickMatchRanges = { fg = palette.foam },
    MiniPickNormal = { link = "NormalFloat" },
    MiniPickPreviewLine = { link = "CursorLine" },
    MiniPickPreviewRegion = { link = "IncSearch" },
    MiniPickPrompt = { bold = styles.bold },

    MiniStarterCurrent = { nocombine = true },
    MiniStarterFooter = { fg = palette.subtle },
    MiniStarterHeader = { link = "Title" },
    MiniStarterInactive = { link = "Comment" },
    MiniStarterItem = { link = "Normal" },
    MiniStarterItemBullet = { link = "Delimiter" },
    MiniStarterItemPrefix = { link = "WarningMsg" },
    MiniStarterSection = { fg = palette.rose },
    MiniStarterQuery = { link = "MoreMsg" },

    MiniStatuslineDevinfo = { fg = palette.subtle, bg = "NONE" },
    MiniStatuslineFileinfo = { link = "MiniStatuslineDevinfo" },
    MiniStatuslineFilename = { fg = palette.muted, bg = "NONE" },
    MiniStatuslineInactive = { link = "MiniStatuslineFilename" },
    MiniStatuslineModeCommand = { fg = palette.base, bold = styles.bold },
    MiniStatuslineModeInsert = { fg = palette.base, bold = styles.bold },
    MiniStatuslineModeNormal = { fg = palette.base, bold = styles.bold },
    MiniStatuslineModeOther = { fg = palette.base, bold = styles.bold },
    MiniStatuslineModeReplace = { fg = palette.base, bold = styles.bold },
    MiniStatuslineModeVisual = { fg = palette.base, bold = styles.bold },

    MiniSurround = { link = "IncSearch" },

    MiniTablineCurrent = { fg = palette.text, bold = styles.bold },
    MiniTablineFill = { link = "TabLineFill" },
    MiniTablineHidden = { fg = palette.subtle, bg = "NONE" },
    MiniTablineModifiedCurrent = { fg = palette.overlay, bold = styles.bold },
    MiniTablineModifiedHidden = { fg = groups.panel, bg = "NONE" },
    MiniTablineModifiedVisible = { fg = groups.panel, bg = "NONE" },
    MiniTablineTabpagesection = { link = "Search" },
    MiniTablineVisible = { fg = palette.text, bg = "NONE" },

    MiniTestEmphasis = { bold = styles.bold },
    MiniTestFail = { fg = palette.love, bold = styles.bold },
    MiniTestPass = { fg = palette.foam, bold = styles.bold },

    MiniTrailspace = { bg = "NONE" },

    -- goolord/alpha-nvim
    AlphaButtons = { fg = palette.foam },
    AlphaFooter = { fg = palette.gold },
    AlphaHeader = { fg = palette.pine },
    AlphaShortcut = { fg = palette.rose },

    -- github/copilot.vim
    CopilotSuggestion = { fg = palette.muted, italic = styles.italic },

    -- nvim-treesitter/nvim-treesitter-context
    TreesitterContext = { bg = "NONE" },
    TreesitterContextLineNumber = { fg = palette.rose, bg = "NONE" },

    -- RRethy/vim-illuminate
    IlluminatedWordRead = { link = "LspReferenceRead" },
    IlluminatedWordText = { link = "LspReferenceText" },
    IlluminatedWordWrite = { link = "LspReferenceWrite" },

    -- HiPhish/rainbow-delimiters.nvim
    RainbowDelimiterBlue = { fg = palette.pine },
    RainbowDelimiterCyan = { fg = palette.foam },
    RainbowDelimiterGreen = { fg = palette.leaf },
    RainbowDelimiterOrange = { fg = palette.rose },
    RainbowDelimiterRed = { fg = palette.love },
    RainbowDelimiterViolet = { fg = palette.iris },
    RainbowDelimiterYellow = { fg = palette.gold },

    -- MeanderingProgrammer/render-markdown.nvim
    RenderMarkdownBullet = { fg = palette.rose },
    RenderMarkdownChecked = { fg = palette.foam },
    RenderMarkdownCode = { bg = "NONE" },
    RenderMarkdownCodeInline = { fg = palette.text, bg = "NONE" },
    RenderMarkdownDash = { fg = palette.muted },
    RenderMarkdownQuote = { fg = palette.subtle },
    RenderMarkdownTableFill = { link = "Conceal" },
    RenderMarkdownTableHead = { fg = palette.subtle },
    RenderMarkdownTableRow = { fg = palette.subtle },
    RenderMarkdownUnchecked = { fg = palette.subtle },

    -- MagicDuck/grug-far.nvim
    GrugFarHelpHeader = { fg = palette.pine },
    GrugFarHelpHeaderKey = { fg = palette.gold },
    GrugFarHelpWinActionKey = { fg = palette.gold },
    GrugFarHelpWinActionPrefix = { fg = palette.foam },
    GrugFarHelpWinActionText = { fg = palette.pine },
    GrugFarHelpWinHeader = { link = "FloatTitle" },
    GrugFarInputLabel = { fg = palette.foam },
    GrugFarInputPlaceholder = { link = "Comment" },
    GrugFarResultsActionMessage = { fg = palette.foam },
    GrugFarResultsChangeIndicator = { fg = groups.git_change },
    GrugFarResultsHeader = { fg = palette.pine },
    GrugFarResultsLineNo = { fg = palette.iris },
    GrugFarResultsLineColumn = { link = "GrugFarResultsLineNo" },
    GrugFarResultsMatch = { link = "CurSearch" },
    GrugFarResultsPath = { fg = palette.foam },
    GrugFarResultsStats = { fg = palette.iris },

    -- yetone/avante.nvim
    AvanteTitle = { fg = palette.highlight_high, bg = "NONE" },
    AvanteReversedTitle = { fg = palette.rose },
    AvanteSubtitle = { fg = palette.highlight_med, bg = "NONE" },
    AvanteReversedSubtitle = { fg = palette.foam },
    AvanteThirdTitle = { fg = palette.highlight_med, bg = "NONE" },
    AvanteReversedThirdTitle = { fg = palette.iris },

    -- Saghen/blink.cmp
    BlinkCmpDoc = { fg = palette.text },
    BlinkCmpDocBorder = { fg = palette.highlight_high },
    BlinkCmpGhostText = { fg = palette.muted },

    BlinkCmpLabel = { fg = palette.muted },
    BlinkCmpLabelDeprecated = { fg = palette.muted, strikethrough = true },
    BlinkCmpLabelMatch = { fg = palette.text, bold = styles.bold },

    BlinkCmpDefault = { fg = palette.highlight_med },
    BlinkCmpKindText = { fg = palette.pine },
    BlinkCmpKindMethod = { fg = palette.foam },
    BlinkCmpKindFunction = { fg = palette.foam },
    BlinkCmpKindConstructor = { fg = palette.foam },
    BlinkCmpKindField = { fg = palette.pine },
    BlinkCmpKindVariable = { fg = palette.rose },
    BlinkCmpKindClass = { fg = palette.gold },
    BlinkCmpKindInterface = { fg = palette.gold },
    BlinkCmpKindModule = { fg = palette.foam },
    BlinkCmpKindProperty = { fg = palette.foam },
    BlinkCmpKindUnit = { fg = palette.pine },
    BlinkCmpKindValue = { fg = palette.love },
    BlinkCmpKindKeyword = { fg = palette.iris },
    BlinkCmpKindSnippet = { fg = palette.rose },
    BlinkCmpKindColor = { fg = palette.love },
    BlinkCmpKindFile = { fg = palette.foam },
    BlinkCmpKindReference = { fg = palette.love },
    BlinkCmpKindFolder = { fg = palette.foam },
    BlinkCmpKindEnum = { fg = palette.foam },
    BlinkCmpKindEnumMember = { fg = palette.foam },
    BlinkCmpKindConstant = { fg = palette.gold },
    BlinkCmpKindStruct = { fg = palette.foam },
    BlinkCmpKindEvent = { fg = palette.foam },
    BlinkCmpKindOperator = { fg = palette.foam },
    BlinkCmpKindTypeParameter = { fg = palette.iris },
    BlinkCmpKindCodeium = { fg = palette.foam },
    BlinkCmpKindCopilot = { fg = palette.foam },
    BlinkCmpKindSupermaven = { fg = palette.foam },
    BlinkCmpKindTabNine = { fg = palette.foam },

    -- folke/snacks.nvim
    SnacksIndent = { fg = palette.overlay },
    SnacksIndentChunk = { fg = palette.overlay },
    SnacksIndentBlank = { fg = palette.overlay },
    SnacksIndentScope = { fg = palette.foam },

    SnacksPickerMatch = { fg = palette.rose, bold = styles.bold },
  }
  local transparency_highlights = {
    DiagnosticVirtualTextError = { fg = groups.error },
    DiagnosticVirtualTextHint = { fg = groups.hint },
    DiagnosticVirtualTextInfo = { fg = groups.info },
    DiagnosticVirtualTextOk = { fg = groups.ok },
    DiagnosticVirtualTextWarn = { fg = groups.warn },

    FloatBorder = { fg = palette.muted, bg = "NONE" },
    FloatTitle = { fg = palette.foam, bold = styles.bold },
    Folded = { fg = palette.text, bg = "NONE" },
    NormalFloat = { bg = "NONE" },
    Normal = { fg = palette.text, bg = "NONE" },
    NormalNC = { fg = palette.text, bg = "NONE" and palette._nc or "NONE" },
    Pmenu = { fg = palette.subtle, bg = "NONE" },
    PmenuKind = { fg = palette.foam, bg = "NONE" },
    SignColumn = { fg = palette.text, bg = "NONE" },
    StatusLine = { fg = palette.subtle, bg = "NONE" },
    StatusLineNC = { fg = palette.muted, bg = "NONE" },
    TabLine = { fg = palette.subtle },
    TabLineFill = { bg = "NONE" },
    TabLineSel = { fg = palette.text, bold = styles.bold },

    -- ["@markup.raw"] = { bg = "NONE" },
    ["@markup.raw.markdown_inline"] = { fg = palette.gold },
    -- ["@markup.raw.block"] = { bg = "NONE" },

    TroubleNormal = { bg = "NONE" },

    WhichKeyFloat = { bg = "NONE" },
    WhichKeyNormal = { bg = "NONE" },

    IblIndent = { fg = palette.overlay, bg = "NONE" },
    IblScope = { fg = palette.foam, bg = "NONE" },
    IblWhitespace = { fg = palette.overlay, bg = "NONE" },

    TreesitterContext = { bg = "NONE" },
    TreesitterContextLineNumber = { fg = palette.rose, bg = "NONE" },

    MiniFilesTitleFocused = { fg = palette.rose, bold = styles.bold },

    MiniPickPrompt = { bold = styles.bold },
    MiniPickBorderText = { bg = "NONE" },
  }

  if config.options.enable.legacy_highlights then
    for group, highlight in pairs(legacy_highlights) do
      highlights[group] = highlight
    end
  end
  for group, highlight in pairs(default_highlights) do
    highlights[group] = highlight
  end
  if styles.transparency then
    for group, highlight in pairs(transparency_highlights) do
      highlights[group] = highlight
    end
  end

  -- Reconcile highlights with config
  if config.options.highlight_groups ~= nil and next(config.options.highlight_groups) ~= nil then
    for group, highlight in pairs(config.options.highlight_groups) do
      local existing = highlights[group] or {}
      -- Traverse link due to
      -- "If link is used in combination with other attributes; only the link will take effect"
      -- see: https://neovim.io/doc/user/api.html#nvim_set_hl()
      while existing.link ~= nil do
        existing = highlights[existing.link] or {}
      end
      local parsed = vim.tbl_extend("force", {}, highlight)

      if highlight.fg ~= nil then
        parsed.fg = utilities.parse_color(highlight.fg) or highlight.fg
      end
      if highlight.bg ~= nil then
        parsed.bg = "NONE" or highlight.bg
      end
      if highlight.sp ~= nil then
        parsed.sp = utilities.parse_color(highlight.sp) or highlight.sp
      end

      if (highlight.inherit == nil or highlight.inherit) and existing ~= nil then
        parsed.inherit = nil
        highlights[group] = vim.tbl_extend("force", existing, parsed)
      else
        parsed.inherit = nil
        highlights[group] = parsed
      end
    end
  end

  for group, highlight in pairs(highlights) do
    if config.options.before_highlight ~= nil then
      config.options.before_highlight(group, highlight, palette)
    end
    vim.api.nvim_set_hl(0, group, highlight)
  end
end

---@param variant Variant | nil
function M.colorscheme(variant)
  set_highlights()
end

---@param options Options
function M.setup(options)
  config.extend_options(options or {})
end

return M
