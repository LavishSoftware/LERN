objectdef ldio_controller_ipcClient2
{
    method Initialize()
    {
        ldio:LoadPackageFile[ipc-client-2.ldioPackage.json]
        LGUI2:LoadPackageFile[ipc-client-2.lgui2Package.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[ipc-client-2.lgui2Package.json]
        ldio:UnloadPackageFile[ipc-client-2.ldioPackage.json]
    }   
}

variable(global) ldio_controller_ipcClient2 LDIOController_IPCClient2
 
function main()
{       
    ldiopatch.Get[ipc-client-out]:Send[ipc-client-connect porn]
    while 1
        waitframe
}