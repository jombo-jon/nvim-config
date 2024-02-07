local M = {}

-- General Setup
M.setutp = function()
    vim.cmd [[
        augroup FileTypeAutocmds
            autocmd!
            autocmd FileType vhdl lua require('autocmds').vhdl_setup()
        augroup END
    ]]

end

-- VHDL
M.vhdl_setup = function()
    vim.cmd [[
        augroup VHDLFileTypeSettings
            autocmd!
            autocmd FileType vhdl  setlocal noexpandtab tabstop=4 shiftwidth=4
        augroup END
    ]]
    vim.opt.commentstring="-- %s";
end

return M
