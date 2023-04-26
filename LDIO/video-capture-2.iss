objectdef ldio_controller_videoCapture2
{
    method Initialize()
    {
        ldio:LoadPackageFile[video-capture-2.ldioPackage.json]
        LGUI2:LoadPackageFile[video-capture-2.lgui2Package.json]

        CaptureDevice:Set["${display.CaptureDevices.Get[1]~}"]
        display:SetCaptureListener["${CaptureDevice~}",video-capture-input,1]
    }

    method Shutdown()
    {
        display:SetCaptureListener["${CaptureDevice~}",]
        LGUI2:UnloadPackageFile[video-capture-2.lgui2Package.json]
        ldio:UnloadPackageFile[video-capture-2.ldioPackage.json]
    }   

    variable string CaptureDevice
}

variable(global) ldio_controller_videoCapture2 LDIOController_VideoCapture2
 
function main()
{       
    while 1
        waitframe
}