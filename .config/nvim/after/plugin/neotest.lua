require("neotest").setup({
  adapters = {
    require("neotest-python"), -- Python adapter
    require("neotest-rust"), -- Rust adapter
    require("neotest-testthat"), -- R adapter
    require("neotest-vim-test")({ -- Wrapper around vim-test
        ignore_file_types = { "python", "vim", "rust", "r" },
    }), 
  },
})
