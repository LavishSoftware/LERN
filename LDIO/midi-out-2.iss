objectdef ldio_controller_midiout2
{
    method Initialize()
    {
    }

    method Shutdown()
    {
        ; stop the timer
        ldiopatch.Get[timer-1]:Send[stop]
        ; turn off all notes playing on the MIDI synthesizer, on any channel
        ldiopatch.Get[synth]:Send[all-notes-off]

        ldio:UnloadPackageFile[midi-out-2.ldioPackage.json]
    }

    method Go()
    {
        ldio:LoadPackageFile[midi-out-2.ldioPackage.json]
        ; start the timer
        ldiopatch.Get[timer-1]:Send[start]
    }
}

variable ldio_controller_midiout2 LDIOController_MIDIOut2
 
function main()
{   
    ; initialize MIDI. open all devices out
    ; the wait is probably longer than required, but this is an asynchronous operation
    midi:OpenAllDevicesOut
    wait 5

    ; and let's go
    LDIOController_MIDIOut2:Go
    
    while 1
        waitframe
}