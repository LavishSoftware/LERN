objectdef ldio_controller_ipcClient1
{
    method Initialize()
    {
        ldio:LoadPackageFile[ipc-client-1.ldioPackage.json]
    }

    method Shutdown()
    {
        ldiopatch.Get[ipc-client-out]:Send[ipc-client-disconnect]
        ldio:UnloadPackageFile[ipc-client-1.ldioPackage.json]
    }   
}

variable(global) ldio_controller_ipcClient1 LDIOController_IPCClient1
 
function main()
{       
    ldiopatch.Get[ipc-client-out]:Send[ipc-client-connect boobies]
    while 1
        waitframe
}