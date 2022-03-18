objectdef button1_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[button-1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[button-1.json]
    }
}

variable(global) button1_controller Button1Controller
 
function main()
{
    while 1
        waitframe
}