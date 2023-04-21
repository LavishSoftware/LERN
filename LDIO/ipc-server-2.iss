objectdef ldio_controller_ipcServer2
{
    method Initialize()
    {
        ldio:LoadPackageFile[ipc-server-2.ldioPackage.json]
    }

    method Shutdown()
    {
        ldiopatch.Get[ipc-server]:Send["ipc-server-stop-listen"]
        ldio:UnloadPackageFile[ipc-server-2.ldioPackage.json]
        display:SetListener[]
    }   

    method OnFeedback()
    {
        echo "OnFeedback ${Context.Command} ${Context.Args~} Route: ${Context.Route~}"

        switch ${Context.Command}
        {
            case ipc-connected-in
                ;echo display:SetListener[${Context.Args.GetInteger[2]}]
                ldiopatch.Get["video-capture-out"]:SetOutput[${Context.Args.GetInteger[2]}]
                display:SetListener["video-capture-in"]                
                break
            case ipc-disconnected
                display:SetListener[]
                break
        }
    }
}

variable(global) ldio_controller_ipcServer2 LDIOController_IPCServer2
 
function main()
{       
   ldiopatch.Get[ipc-server]:Send["ipc-server-listen"]
    while 1
        waitframe
}