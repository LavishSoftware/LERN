objectdef ldio_controller_midi1
{
    method Initialize()
    {
        ldio:LoadPackageFile[midi-1.ldioPackage.json]
    }

    method Shutdown()
    {
        ldiopatch.Get[timer-1]:Send[stop]
        ldiopatch.Get[synth]:Send[all-notes-off]
        ldio:UnloadPackageFile[midi-1.ldioPackage.json]
    }

    method Go()
    {
        ldiopatch.Get[timer-1]:Send[start]
    }
}

variable ldio_controller_midi1 LDIOController_MIDI1
 
function main()
{   
    ; initialize MIDI. open all devices in and out
    ; the waits are probably longer than required, but these are asynchronous operations
    midi:OpenAllDevicesIn
    wait 5
    midi:OpenAllDevicesOut
    wait 5
    /**/

    ; MIDI input devices are opened in exclusive mode, which prevents other applications from also opening the device.
    ; By default, IS will release the device when it is in the background. Set "Retain" to hold the device all the time.
    midiindevice:ForEach["ForEach.Value:SetRetain[1]"]

    LDIOController_MIDI1:Go
    
    while 1
        waitframe
}