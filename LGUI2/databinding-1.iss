objectdef databinding1_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[databinding-1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[databinding-1.json]
    }
}

variable(global) databinding1_controller DataBinding1Controller
 
function main()
{
    while 1
        waitframe
}