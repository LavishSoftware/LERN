objectdef lgui2_controller
{

    method Initialize()
    {
        LGUI2:LoadPackageFile[1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[1.json]
    }
}

variable lgui2_controller LGUI2Controller
 
function main()
{
    while 1
        waitframe
}