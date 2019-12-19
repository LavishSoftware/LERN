objectdef lgui2_controller
{
    variable bool CheckedState=1

    method Initialize()
    {
        LGUI2:LoadPackageFile[databinding-2.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[databinding-2.json]
    }
}

variable(global) lgui2_controller LGUI2Controller
 
function main()
{
    while 1
        waitframe
}