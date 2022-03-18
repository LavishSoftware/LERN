objectdef style1_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[style-1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[style-1.json]
    }
}

variable(global) style1_controller Style1Controller
 
function main()
{
    while 1
        waitframe
}