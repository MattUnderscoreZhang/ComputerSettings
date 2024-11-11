-- Toggle PDF viewer for vimtex.
-- Currently does not work - see https://www.reddit.com/r/LaTeX/comments/11xak82/using_neovim_latex_and_a_terminal_pdfviewer/

function VimtexPDFToggle()
    if vim.g.term_pdf_viewer_open then
        print("A")
        vim.fn.system("kitty @ close-window --match title:termpdf")
        vim.g.term_pdf_viewer_open = false
    else
        print("B")
        vim.fn.system("kitty @ launch --location=vsplit --cwd=current --title=termpdf")

        --local command = "termpdf " .. vim.api.nvim_call_function("expand", {"%:r"}) .. ".pdf" .. "'\r'"
        --local kitty = "kitty @ send-text --match title:termpdf "
        --vim.fn.system(kitty .. command)
        vim.g.term_pdf_viewer_open = true
    end
end

local map = vim.api.nvim_set_keymap
local options = {noremap=true, silent=true}
map("n", "<leader>q", ":lua VimtexPDFToggle()<cr>", options)
