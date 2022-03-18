objectdef imagebox1_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[imagebox-1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[imagebox-1.json]
    }
}

variable(global) imagebox1_controller ImageBox1Controller
 
function main()
{
    while 1
        waitframe
}