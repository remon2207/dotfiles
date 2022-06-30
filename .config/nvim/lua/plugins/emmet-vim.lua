-- api.nvim_set_var('user_emmet_mode', '1')

vim.cmd[[
let g:user_emmet_settings = {
\    'variables': {'lang': 'ja'},
\    'html': {
\        'default_attributes': {
\            'option': {'value': v:null},
\            'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\        },
\        'snippets': {
\            'html:5': "<!DOCTYPE html>\n"
\                ."<html lang=\"${lang}\">\n"
\                ."\t<head>\n"
\                ."\t\t<meta charset=\"${charset}\" />\n"
\                ."\t\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n"
\                ."\t\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n"
\                ."\t\t<title></title>\n"
\                ."\t</head>\n"
\                ."\t<body>\n\t\t${child}|\n\t</body>\n"
\                ."</html>",
\            '!': "\t\t<meta charSet=\"${charset}\" />\n"
\                ."\t\t<meta httpEquiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n"
\                ."\t\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n"
\                ."\t\t<title>{title}</title>\n",
\        },
\    },
\}
]]
