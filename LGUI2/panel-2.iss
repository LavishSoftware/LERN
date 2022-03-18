objectdef panel2_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[panel-2.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[panel-2.json]
    }
}

variable(global) panel2_controller Panel2Controller
 
function main()
{
    while 1
        waitframe
}