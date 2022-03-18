objectdef audio4_controller
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

variable audio4_controller Audio4Controller
 
function main()
{
    while 1
        waitframe
}