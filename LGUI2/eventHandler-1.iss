objectdef lgui2_controller
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

variable(global) lgui2_controller LGUI2Controller
 
function main()
{
    while 1
        waitframe
}