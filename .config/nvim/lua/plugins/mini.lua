local status, base16 = pcall(require, 'mini.base16')
if not status then
  return
end

local base16_solarized = {
  base00 = '#002b36',
  base01 = '#073642',
  base02 = '#586e75',
  base03 = '#657b83',
  base04 = '#839496',
  base05 = '#93a1a1',
  base06 = '#eee8d5',
  base07 = '#fdf6e3',
  base08 = '#b58900',
  base09 = '#cb4b16',
  base0A = '#dc322f',
  base0B = '#d33682',
  base0C = '#6c71c4',
  base0D = '#268bd2',
  base0E = '#2aa198',
  base0F = '#859900',
}

base16.setup({
  palette = base16_solarized,
  use_cterm = false,
})

local api = vim.api

api.nvim_set_hl(0, 'Floatborder', { bg = 'none', fg = '#073642' })
api.nvim_set_hl(0, 'CursorLineNr', { fg = '#b58900', ctermfg = 11 })
api.nvim_set_hl(0, 'WinBar', { bg = 'none', fg = '#839496' })

api.nvim_set_hl(0, 'TSType', { link = 'Type' })
api.nvim_set_hl(0, 'TSTag', { link = 'Label' })
api.nvim_set_hl(0, '@tag', { link = 'TSTag' })
api.nvim_set_hl(0, 'TSStrong', { bold = true })
api.nvim_set_hl(0, '@text.strong', { link = 'TSStrong' })
api.nvim_set_hl(0, 'TSAttribute', { link = 'PreProc' })
api.nvim_set_hl(0, '@tag.attribute', { link = 'TSTagAttribute' })
api.nvim_set_hl(0, 'TSProperty', { link = 'Identifier' })
api.nvim_set_hl(0, 'TSTagAttribute', { link = 'TSProperty' })
api.nvim_set_hl(0, 'TSTagDelimiter', { link = 'Delimiter' })
api.nvim_set_hl(0, '@tag.delimiter', { link = 'TSTagDelimiter' })

api.nvim_set_hl(0, 'TSEmphasis', { fg = '#cb4b16' })
api.nvim_set_hl(0, '@text.emphasis', { link = 'TSEmphasis' })
api.nvim_set_hl(0, 'TSStrike', { strikethrough = true, fg = '#002b36' })
api.nvim_set_hl(0, '@text.strike', { link = 'TSStrike' })
api.nvim_set_hl(0, 'TSTitle', { link = 'Title' })
api.nvim_set_hl(0, '@text.title', { link = 'TSTitle' })
api.nvim_set_hl(0, 'TSLiteral', { fg = '#cb4b16' })
api.nvim_set_hl(0, '@text.literal', { link = 'TSLiteral' })
api.nvim_set_hl(0, 'TSURI', { underline = true, fg = '#cb4b16' })
api.nvim_set_hl(0, '@text.uri', { link = 'TSURI' })
api.nvim_set_hl(0, '@text.math', { link = 'Number' })
api.nvim_set_hl(0, '@text.environment', { link = 'Macro' })
api.nvim_set_hl(0, '@text.environment.name', { link = 'Type' })
api.nvim_set_hl(0, 'TSParameterReference', { fg = '#93a1a1' })
api.nvim_set_hl(0, '@text.reference', { link = 'TSParameterReference' })
api.nvim_set_hl(0, '@text.todo', { link = 'Todo' })
api.nvim_set_hl(0, '@text.note', { link = 'Tag' })
api.nvim_set_hl(0, '@text.warning', { link = 'DiagnosticWarn' })
api.nvim_set_hl(0, '@text.danger', { link = 'DiagnosticError' })
api.nvim_set_hl(0, 'TSConstBuiltin', { link = 'Special' })
api.nvim_set_hl(0, '@constant.builtin', { link = 'TSConstBuiltin' })

-- @text          xxx links to TSText
-- @text.underline xxx links to TSUnderline
-- Underlined     xxx cterm=underline ctermfg=81 gui=underline guifg=#dc322f
-- @todo          xxx links to Todo
-- @debug         xxx links to Debug
-- @comment       xxx links to TSComment
-- Comment        xxx ctermfg=14 guifg=#657b83
-- @punctuation   xxx links to Delimiter
-- @constant      xxx links to TSConstant
-- @constant.builtin xxx links to TSConstant
-- @constant.macro xxx links to TSConstant
-- @define        xxx links to Define
-- @macro         xxx links to Macro
-- @string        xxx links to TSString
-- @string.escape xxx links to TSStringEscape
-- @character     xxx links to TSCharacter
-- @character.special xxx links to SpecialChar
-- @number        xxx links to TSNumber
-- @boolean       xxx links to TSBoolean
-- @float         xxx links to TSFloat
-- @function      xxx links to TSFunction
-- @function.builtin xxx links to TSFuncBuiltin
-- @function.macro xxx links to TSFuncMacro
-- @parameter     xxx links to TSParameter
-- @method        xxx links to TSMethod
-- @field         xxx links to TSField
-- @property      xxx links to TSProperty
-- @constructor   xxx links to TSConstructor
-- @conditional   xxx links to TSConditional
-- @repeat        xxx links to TSRepeat
-- @label         xxx links to TSLabel
-- @operator      xxx links to TSOperator
-- @keyword       xxx links to TSKeyword
-- @exception     xxx links to TSException
-- @type          xxx links to TSType
-- @type.definition xxx links to TSType
-- @storageclass  xxx links to StorageClass
-- @structure     xxx links to Structure
-- @include       xxx links to TSInclude
-- @preproc       xxx links to PreProc

-- TSAnnotation   xxx guifg=#d33682
-- TSAttribute    xxx guifg=#b58900
-- TSBoolean      xxx guifg=#cb4b16
-- TSCharacter    xxx guifg=#b58900
-- TSComment      xxx gui=italic guifg=#657b83
-- TSConstructor  xxx guifg=#268bd2
-- TSConditional  xxx guifg=#6c71c4
-- TSConstant     xxx guifg=#cb4b16
-- TSConstBuiltin xxx gui=italic guifg=#cb4b16
-- TSConstMacro   xxx guifg=#dc322f
-- TSError        xxx guifg=#dc322f
-- TSException    xxx guifg=#dc322f
-- TSField        xxx guifg=#93a1a1
-- TSFloat        xxx guifg=#cb4b16
-- TSFunction     xxx guifg=#268bd2
-- TSFuncBuiltin  xxx gui=italic guifg=#268bd2
-- TSFuncMacro    xxx guifg=#dc322f
-- TSInclude      xxx guifg=#268bd2
-- TSKeyword      xxx guifg=#6c71c4
-- TSKeywordFunction xxx guifg=#6c71c4
-- TSKeywordOperator xxx guifg=#6c71c4
-- TSLabel        xxx guifg=#b58900
-- TSMethod       xxx guifg=#268bd2
-- TSNamespace    xxx guifg=#dc322f
-- TSNone         xxx guifg=#93a1a1
-- TSNumber       xxx guifg=#cb4b16
-- TSOperator     xxx guifg=#93a1a1
-- TSParameter    xxx guifg=#93a1a1
-- TSParameterReference xxx guifg=#93a1a1
-- TSProperty     xxx guifg=#93a1a1
-- TSPunctDelimiter xxx guifg=#d33682
-- TSPunctBracket xxx guifg=#93a1a1
-- TSPunctSpecial xxx guifg=#93a1a1
-- TSRepeat       xxx guifg=#6c71c4
-- TSString       xxx guifg=#859900
-- TSStringRegex  xxx guifg=#2aa198
-- TSStringEscape xxx guifg=#2aa198
-- TSSymbol       xxx guifg=#859900
-- TSTag          xxx guifg=#b58900
-- TSTagDelimiter xxx guifg=#d33682
-- TSText         xxx guifg=#93a1a1
-- TSStrong       xxx gui=bold
-- TSEmphasis     xxx gui=italic guifg=#cb4b16
-- TSUnderline    xxx gui=underline guifg=#002b36
-- TSStrike       xxx gui=strikethrough guifg=#002b36
-- TSTitle        xxx guifg=#268bd2
-- TSLiteral      xxx guifg=#cb4b16
-- TSURI          xxx gui=underline guifg=#cb4b16

-- TSType         xxx guifg=#b58900
-- TSTypeBuiltin  xxx gui=italic guifg=#b58900
-- TSVariable     xxx guifg=#dc322f
-- TSVariableBuiltin xxx gui=italic guifg=#dc322f
-- TSDefinition   xxx gui=underline guisp=#839496
-- TSDefinitionUsage xxx gui=underline guisp=#839496
-- TSCurrentScope xxx gui=bold

-- @error         xxx links to TSError
-- @none          xxx links to TSNone
-- @punctuation.delimiter xxx links to TSPunctDelimiter
-- @punctuation.bracket xxx links to TSPunctBracket
-- @punctuation.special xxx links to TSPunctSpecial
-- @string.regex  xxx links to TSStringRegex
-- @string.special xxx links to SpecialChar
-- @function.call xxx links to TSFunction
-- @method.call   xxx links to TSMethod
-- @keyword.function xxx links to TSKeywordFunction
-- @keyword.operator xxx links to TSKeywordOperator
-- @keyword.return xxx links to TSKeyword
-- @type.builtin  xxx links to TSTypeBuiltin
-- @type.qualifier xxx links to TSType
-- @attribute     xxx links to TSAttribute
-- @variable      xxx links to TSVariable
-- @variable.builtin xxx links to TSVariableBuiltin
-- @namespace     xxx links to TSNamespace
-- @symbol        xxx links to TSSymbol
-- @text.strong   xxx links to TSStrong
-- @text.emphasis xxx links to TSEmphasis
-- @text.strike   xxx links to TSStrike
-- @text.title    xxx links to TSTitle
-- @text.literal  xxx links to TSLiteral
-- @text.uri      xxx links to TSURI
-- @text.math     xxx links to Number
-- @text.environment xxx links to Macro
-- @text.environment.name xxx links to Type
-- @text.reference xxx links to TSParameterReference
-- @text.todo     xxx links to Todo
-- @text.note     xxx links to Tag
-- @text.warning  xxx links to DiagnosticWarn
-- @text.danger   xxx links to DiagnosticError
-- @tag           xxx links to TSTag
-- @tag.attribute xxx links to TSAttribute
-- @tag.delimiter xxx links to TSTagDelimiter
