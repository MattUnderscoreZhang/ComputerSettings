-- Open a diagnostic hover panel when the cursor is over a line with a warning or an error.

function OpenDiagnostic()
    vim.diagnostic.open_float(0, {
        scope = "line",
        focusable = false,
        close_events = {
            "CursorMoved",
            "CursorMovedI",
            "BufHidden",
            "InsertCharPre",
            "WinLeave",
        },
    })
end

vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    pattern = "*",
    command = "lua OpenDiagnostic()",
    group = "lsp_diagnostics_hold",
})
