objectdef ldio_controller_videoCapture3
{
    method Initialize()
    {
        ldio:LoadPackageFile[video-capture-3.ldioPackage.json]
        LGUI2:LoadPackageFile[video-capture-3.lgui2Package.json]

        CaptureDevice1:Set["${display.CaptureDevices.Get[1]~}"]
        CaptureDevice2:Set["${display.CaptureDevices.Get[2]~}"]
        display:SetCaptureListener["${CaptureDevice1~}",video-capture-input1,1]
        display:SetCaptureListener["${CaptureDevice2~}",video-capture-input2,1]
    }

    method Shutdown()
    {
        display:SetCaptureListener["${CaptureDevice1~}",]
        display:SetCaptureListener["${CaptureDevice2~}",]
        LGUI2:UnloadPackageFile[video-capture-3.lgui2Package.json]
        ldio:UnloadPackageFile[video-capture-3.ldioPackage.json]
    }   

    variable string CaptureDevice1
    variable string CaptureDevice2
}

variable(global) ldio_controller_videoCapture3 LDIOController_VideoCapture3
 
function main()
{       
    while 1
        waitframe
}