objectdef lgui2_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[button-1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[button-1.json]
    }
}

variable(global) lgui2_controller LGUI2Controller
 
function main()
{
    while 1
        waitframe
}