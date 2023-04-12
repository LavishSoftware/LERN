objectdef ldio_controller_kbm3
{
    method Initialize()
    {
        ldio:LoadPackageFile[kbm-3.ldioPackage.json]
        keyboard:SetInPatch[inputs]
    }

    method Shutdown()
    {
        keyboard:SetInPatch[]
        ldio:UnloadPackageFile[kbm-3.ldioPackage.json]
    }   

    method OnEscape()
    {
        echo Escape pressed, ending kbm-3
        Script:End
    }
}

variable(global) ldio_controller_kbm3 LDIOController_KBM3
 
function main()
{       
    echo "this script will INTERCEPT AND BLOCK all keyboard input until \ayEsc\ax is pressed."
    
    while 1
        waitframe
}