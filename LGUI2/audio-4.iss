objectdef lgui2_controller
{

    method Initialize()
    {
        LGUI2:LoadPackageFile[audio-4.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[audio-4.json]
    }
}

variable lgui2_controller LGUI2Controller
 
function main()
{
    while 1
        waitframe
}