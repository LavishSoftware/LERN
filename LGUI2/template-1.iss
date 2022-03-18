objectdef template1_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[template-1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[template-1.json]
    }
}

variable(global) template1_controller Template1Controller
 
function main()
{
    while 1
        waitframe
}