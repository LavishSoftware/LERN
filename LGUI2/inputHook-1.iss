objectdef inputhook1_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[inputhook-1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[inputhook-1.json]
    }
}

variable(global) inputhook1_controller InputHook1Controller
 
function main()
{
    while 1
        waitframe
}