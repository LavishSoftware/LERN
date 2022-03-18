objectdef audio1_controller
{

    method Initialize()
    {
        LGUI2:LoadPackageFile[audio-1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[audio-1.json]
    }
}

variable audio1_controller Audio1Controller
 
function main()
{
    while 1
        waitframe
}