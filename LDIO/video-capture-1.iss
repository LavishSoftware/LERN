objectdef ldio_controller_videoCapture1
{
    method Initialize()
    {
        ldio:LoadPackageFile[video-capture-1.ldioPackage.json]
        LGUI2:LoadPackageFile[video-capture-1.lgui2Package.json]
        display:SetListener[video-capture-input]
    }

    method Shutdown()
    {
        display:SetListener[]
        LGUI2:UnloadPackageFile[video-capture-1.lgui2Package.json]
        ldio:UnloadPackageFile[video-capture-1.ldioPackage.json]
    }   
}

variable(global) ldio_controller_videoCapture1 LDIOController_VideoCapture1
 
function main()
{       
    while 1
        waitframe
}