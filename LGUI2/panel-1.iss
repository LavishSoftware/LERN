objectdef panel1_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[panel-1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[panel-1.json]
    }
}

variable(global) panel1_controller Panel1Controller
 
function main()
{
    while 1
        waitframe
}