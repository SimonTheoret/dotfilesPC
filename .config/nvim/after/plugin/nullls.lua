local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.diagnostics.pylint,
    null_ls.builtins.diagnostics.trail_space,
    null_ls.builtins.formatting.lua_format,
    null_ls.builtins.formatting.latexindent,
    null_ls.builtins.diagnostics.luacheck, null_ls.builtins.formatting.format_r,
    null_ls.builtins.diagnostics.flake8, null_ls.builtins.diagnostics.chktex,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.google_java_format,
    null_ls.builtins.formatting.rustfmt
}
null_ls.setup({ sources = sources })
