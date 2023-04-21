objectdef ldio_controller_netClient2
{
    method Initialize()
    {
        ldio:LoadPackageFile[net-client-2.ldioPackage.json]
        LGUI2:LoadPackageFile[net-client-2.lgui2Package.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[net-client-2.lgui2Package.json]
        ldio:UnloadPackageFile[net-client-2.ldioPackage.json]
    }   
}

variable(global) ldio_controller_netClient2 LDIOController_NetClient2
 
function main()
{       
    ldiopatch.Get[net-client-out]:Send[net-client-connect localhost 12034]
    while 1
        waitframe
}