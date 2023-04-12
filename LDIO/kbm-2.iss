objectdef ldio_controller_kbm2
{
    method Initialize()
    {
        ldio:LoadPackageFile[kbm-2.ldioPackage.json]
        keyboard:SetListener[inputs]
    }

    method Shutdown()
    {
        keyboard:SetListener[]
        ldio:UnloadPackageFile[kbm-2.ldioPackage.json]
    }   
}

variable ldio_controller_kbm2 LDIOController_KBM2
 
function main()
{       
    echo "this script will listen to keyboard input until exited."
    echo "\ayendscript kbm-2\ax"
    
    while 1
        waitframe
}