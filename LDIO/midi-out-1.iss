function main()
{   
    ; initialize MIDI. open all devices out
    ; the wait is probably longer than required, but this is an asynchronous operation
    midi:OpenAllDevicesOut
    wait 5

    echo "Attached MIDI Output devices..."
    echo "${midioutdevice.List~}"

    /*
    [
        {"manufacturerID":0,"productID":0,"driverVersionMajor":0,"driverVersionMinor":0,
        "deviceName":"Microsoft GS Wavetable Synth",   <--------------------------
        "driverSupport":0,"technology":0,"voices":0,"notes":0,"channelMask":0,
        "name":"MIDIOUT 1"  <------------------ could use, but different devices can get assigned this name
        }
    ]
    */

    ; we can access this device with a substring search
    echo "${midioutdevice.Get["Microsoft GS"].DeviceName~}"   
    ; Expected output: Microsoft GS Wavetable Synth

    ; the device will have a "device-out" LDIO patch:
    echo "${midioutdevice.Get["Microsoft GS"].Patch.Type~}"
    ; Expected output: device-out

    ; device-out recognizes MIDI commands. 
    ; a midi note can be played with an "on" followed by an "off"
    ; both commands require...
    ; 1. a MIDI channel number (0-15)
    ; 2. a MIDI note number (0-127)   60 is middle C, 72 is C one octave up
    ; and ON requires...
    ; 3. a velocity (accepted as either 0-127 or 0.0-1.0)
    ; be aware that an "on" with zero velocity is always considered equivalent to "off".

    midioutdevice.Get["Microsoft GS"].Patch:Send[on 0 60 127]
    wait 5
    midioutdevice.Get["Microsoft GS"].Patch:Send[off 0 60 127]
}