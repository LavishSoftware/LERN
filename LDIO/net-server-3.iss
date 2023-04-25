objectdef ldio_controller_netServer3
{
    method Initialize()
    {
        ldio:LoadPackageFile[net-server-3.ldioPackage.json]
    }

    method Shutdown()
    {
        ldiopatch.Get[net-server]:Send["net-server-stop-listen"]
        ldio:UnloadPackageFile[net-server-3.ldioPackage.json]
        display:SetListener[]
    }   

    method OnFeedback()
    {
        echo "OnFeedback ${Context.Command} ${Context.Args~} Route: ${Context.Route~}"

        switch ${Context.Command}
        {
            case net-connected-in
                ;echo display:SetListener[${Context.Args.GetInteger[2]}]
                ldiopatch.Get["video-capture-out"]:SetOutput[${Context.Args.GetInteger[2]}]
                display:SetListener["video-capture-in"]                
                break
            case net-disconnected
                display:SetListener[]
                break
        }
    }
}

variable(global) ldio_controller_netServer3 LDIOController_NetServer3
 
function main()
{       
   ldiopatch.Get[net-server]:Send["net-server-listen"]
    while 1
        waitframe
}