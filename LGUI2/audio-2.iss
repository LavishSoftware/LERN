objectdef audio2_controller
{

    method Initialize()
    {
        LGUI2:LoadPackageFile[audio-2.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[audio-2.json]
    }
}

variable audio2_controller Audio2Controller
 
function main()
{
    while 1
        waitframe
}