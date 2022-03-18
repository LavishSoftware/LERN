objectdef audio3_controller
{

    method Initialize()
    {
        LGUI2:LoadPackageFile[audio-3.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[audio-3.json]
    }
}

variable audio3_controller Audio3Controller
 
function main()
{
    while 1
        waitframe
}