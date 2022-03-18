objectdef eventhandler1_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[eventHandler-1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[eventHandler-1.json]
    }
}

variable(global) eventhandler1_controller EventHandler1Controller
 
function main()
{
    while 1
        waitframe
}