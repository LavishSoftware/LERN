objectdef table1_controller
{

    method Initialize()
    {
        LGUI2:LoadPackageFile[table-1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[table-1.json]
    }
}

variable table1_controller Table1Controller
 
function main()
{
    while 1
        waitframe
}