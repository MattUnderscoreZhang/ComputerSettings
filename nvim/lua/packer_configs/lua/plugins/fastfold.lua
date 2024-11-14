local M = {}

-- Makes code folding much faster by preventing over-eager code folding.
-- To be honest, I don't really know what this does, but it doesn't seem to harm anything to have it.

M.setup = function(use)
    use 'konfekt/fastfold'
end

return M
