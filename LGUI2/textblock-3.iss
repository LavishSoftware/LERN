objectdef lgui2_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[textblock-3.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[textblock-3.json]
    }
}

variable(global) lgui2_controller LGUI2Controller
 
function main()
{
    while 1
        waitframe
}