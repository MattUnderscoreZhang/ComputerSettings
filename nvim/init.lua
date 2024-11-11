function ReloadModule(module_name)
    require('plenary').reload.reload_module(module_name)
    require(module_name)  -- this can cause some issues, as each module's code is run again
end

ReloadModule('plugins')
ReloadModule('options')
ReloadModule('mappings')
ReloadModule('functions')
