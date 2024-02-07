-- local M = {}

-- -- General Setup
-- M.setutp = function()
--     vim.cmd [[
--         augroup FileTypeAutocmds
--             autocmd!
--             autocmd FileType vhdl lua require('autocmds').vhdl_setup()
--         augroup END
--     ]]

-- end
-- General Setup
local function setup()
    vim.cmd [[
        augroup FileTypeAutocmds
            autocmd!
            autocmd FileType vhdl lua require('autocmds').vhdl_setup()
        augroup END
    ]]
end

-- -- VHDL
local function vhdl_setup()
    print("Setting up autocmds for VHDL")
    -- vim.cmd [[
    --     augroup VHDLFileTypeSettings
    --         autocmd!
    --         autocmd FileType vhdl  setlocal noexpandtab tabstop=4 shiftwidth=4
    --     augroup END
    -- ]]
    -- vim.opt.commentstring="-- %s";
end

setup()
