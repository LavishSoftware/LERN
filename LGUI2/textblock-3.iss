objectdef textblock3_controller
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

variable(global) textblock3_controller TextBlock3Controller
 
function main()
{
    while 1
        waitframe
}