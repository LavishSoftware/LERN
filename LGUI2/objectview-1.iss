objectdef objectview1_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[objectview-1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[objectview-1.json]
    }
}

variable(global) objectview1_controller ObjectView1Controller
 
function main()
{
    while 1
        waitframe
}