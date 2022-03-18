objectdef textblock1_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[textblock-1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[textblock-1.json]
    }
}

variable(global) textblock1_controller TextBlock1Controller
 
function main()
{
    while 1
        waitframe
}