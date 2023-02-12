require('code_runner').setup({
    mode = "term",
    focus = false,
    startinsert = true,
    term = {
        --  Position to open the terminal, this option is ignored if mode is tab
        position = "bot",
        -- window size, this option is ignored if tab is true
        size = 6
    },
    float = {
        -- Key that close the code_runner floating window
        close_key = '<ESC>',
        -- Window border (see ':h nvim_open_win')
        border = "none",

        -- Num from `0 - 1` for measurements
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,

        -- Highlight group for floating window/border (see ':h winhl')
        border_hl = "FloatBorder",
        float_hl = "Normal",

        -- Transparency (see ':h winblend')
        blend = 0
    },
    -- put here the commands by filetype
    filetype = {
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
        python = "python3 -u",
        typescript = "deno run",
        rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
    }
})
