objectdef ldio_controller_netServer1
{
    method Initialize()
    {
        ldio:LoadPackageFile[net-server-1.ldioPackage.json]
    }

    method Shutdown()
    {
        ldio:UnloadPackageFile[net-server-1.ldioPackage.json]
    }   
}

variable(global) ldio_controller_netServer1 LDIOController_NetServer1
 
function main()
{       
   ldiopatch.Get[net-server]:Send["net-server-listen"]
    while 1
        waitframe
}