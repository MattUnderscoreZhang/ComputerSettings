function ReloadModule(module_name)
    require('plenary').reload.reload_module(module_name)
    require(module_name)
end

ReloadModule('plugins')
ReloadModule('options')
ReloadModule('mapping')
