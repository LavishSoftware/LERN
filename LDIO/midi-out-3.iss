objectdef ldio_controller_midiout3
{
    method Initialize()
    {
    }

    method Shutdown()
    {
        ldiopatch.Get[guitar-canon]:Send[stop]
        ldiopatch.Get[synth]:Send[all-notes-off]

        ldio:UnloadPackageFile[midi-out-3.ldioPackage.json]
    }

    method Go()
    {
        ldio:LoadPackageFile[midi-out-3.ldioPackage.json]
        ldiopatch.Get[guitar-canon]:Send[start]
    }
}

variable ldio_controller_midiout3 LDIOController_MIDIOut3
 
atom(global) tempo(float newValue=90)
{
    ldiopatch.Get[guitar-canon]:Send[tempo ${newValue}]
}

function main()
{   
    ; initialize MIDI. open all devices out
    ; the wait is probably longer than required, but this is an asynchronous operation
    midi:OpenAllDevicesOut
    wait 5

    ; and let's go
    LDIOController_MIDIOut3:Go
    
    while 1
        waitframe
}