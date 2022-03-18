objectdef checkbox1_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[checkbox-1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[checkbox-1.json]
    }
}

variable(global) checkbox1_controller CheckBox1Controller
 
function main()
{
    while 1
        waitframe
}