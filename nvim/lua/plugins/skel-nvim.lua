-- Auto-creates skeleton templates for new programming files.
-- Skeletons are in ~/.config/nvim/skeleton/.
-- Templates can have placeholders - see https://github.com/motosir/skel-nvim

return {
    'motosir/skel-nvim',
    dependencies = {},
    config = function()
        local skel = require('skel-nvim')
        skel.setup{
            mappings = {
                --['*.cpp'] = "cpp.skel",  -- for *.cpp files, use ~/.config/nvim/skeleton/cpp.skel
                --['LICENSE'] = {"license.mit.skel", "license.gpl.skel" } -- patterns can map to multiple templates
                ['*.html'] = "html.skel",
            },
            substitutions = {
                ['FILENAME'] = function (config)
                    return vim.fs.basename(config.filename):match(  -- get base filename (first match group)
                        "^(.+)%.([^%.]+)$"
                    ):gsub(  -- uppercase each word
                        "(%a)([%w]*)",
                        function(first, rest)
                            return first:upper() .. rest
                        end
                    ):gsub("_", " "):gsub("-", " ")  -- replace underscores and dashes with spaces
                end
            }
        }
    end
}
