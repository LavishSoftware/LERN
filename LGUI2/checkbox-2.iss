objectdef checkbox2_controller
{
    variable bool CheckedState=1

    method Initialize()
    {
        LGUI2:LoadPackageFile[checkbox-2.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[checkbox-2.json]
    }
}

variable(global) checkbox2_controller CheckBox2Controller
 
function main()
{
    while 1
        waitframe
}