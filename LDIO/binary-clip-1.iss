objectdef ldio_controller_binaryClip1
{
    method Initialize()
    {
        ldio:LoadPackageFile[binary-clip-1.ldioPackage.json]
        LGUI2:LoadPackageFile[binary-clip-1.lgui2Package.json]

        CaptureDevice:Set["${display.CaptureDevices.Get[1]~}"]
        display:SetCaptureListener["${CaptureDevice~}",video-capture-input,1]
    }

    method Shutdown()
    {
        display:SetCaptureListener["${CaptureDevice~}",]
        LGUI2:UnloadPackageFile[binary-clip-1.lgui2Package.json]
        ldio:UnloadPackageFile[binary-clip-1.ldioPackage.json]
    }   

    variable string CaptureDevice
}

variable(global) ldio_controller_binaryClip1 LDIOController_BinaryClip1

atom(global) playclip(float historyTime=0.5, float futureTime=0.5)
{
    ; clear out previously stored clip
    ldiopatch.Get[binary-clip]:Send[clip-reset]
    ; request new clip from the running binary-cache
    ldiopatch.Get[video-capture-input]:Send["cache-request \"binary-clip\" \"video-frame\" ${historyTime} ${futureTime}"]
    ; start playing the new clip
    ldiopatch.Get[binary-clip]:Send[clip-play]
}

function main()
{       
    while 1
        waitframe
}