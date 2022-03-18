objectdef trigger1_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[trigger-1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[trigger-1.json]
    }
}

variable(global) trigger1_controller Trigger1Controller
 
function main()
{
    while 1
        waitframe
}