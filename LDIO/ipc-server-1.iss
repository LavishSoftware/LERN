objectdef ldio_controller_ipcServer1
{
    method Initialize()
    {
        ldio:LoadPackageFile[ipc-server-1.ldioPackage.json]
    }

    method Shutdown()
    {
        ldiopatch.Get[ipc-server]:Send[ipc-server-stop-listen]        
        ldio:UnloadPackageFile[ipc-server-1.ldioPackage.json]
    }   
}

variable(global) ldio_controller_ipcServer1 LDIOController_IPCServer1
 
function main()
{       
   ldiopatch.Get[ipc-server]:Send["ipc-server-listen"]
    while 1
        waitframe
}