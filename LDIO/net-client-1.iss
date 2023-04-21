objectdef ldio_controller_netClient1
{
    method Initialize()
    {
        ldio:LoadPackageFile[net-client-1.ldioPackage.json]
    }

    method Shutdown()
    {
        ldio:UnloadPackageFile[net-client-1.ldioPackage.json]
    }   
}

variable(global) ldio_controller_netClient1 LDIOController_NetClient1
 
function main()
{       
    ldiopatch.Get[net-client-out]:Send[net-client-connect localhost 12034]
    while 1
        waitframe
}