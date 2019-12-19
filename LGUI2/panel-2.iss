objectdef lgui2_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[panel-2.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[panel-2.json]
    }
}

variable(global) lgui2_controller LGUI2Controller
 
function main()
{
    while 1
        waitframe
}