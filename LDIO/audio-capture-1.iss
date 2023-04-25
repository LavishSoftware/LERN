objectdef ldio_controller_audioCapture1
{
    method Initialize()
    {
        audio:AddVoice[audio-capture-1]
        ldio:LoadPackageFile[audio-capture-1.ldioPackage.json]
        audio:SetListener[default-input,audio-capture-in]
        ldiopatch.Get[audio-stream-out]:Send[stream-start]
    }

    method Shutdown()
    {
        ldiopatch.Get[audio-stream-out]:Send[stream-stop]
        audio:SetListener[default-input,]
        ldio:UnloadPackageFile[audio-capture-1.ldioPackage.json]
        audio:RemoveVoice[audio-capture-1]
    }
}

variable ldio_controller_audioCapture1 LDIOController_AudioCapture1
 
function main()
{       
    while 1
        waitframe
}