# LERN/LGUI2/audio-1
This example introduces Audio functionality (see [Audio/1.md](../Audio/1.md)) in LavishGUI 2, including ```audio``` event handlers (see [eventHandler-1.json](eventHandler-1.json)).

This example, like most LGUI2 examples, consists of a controller object in LavishScript (in [audio-1.iss](audio-1.iss)) and a LavishGUI 2 package file ([audio-1.json](audio-1.json))

Run the script with ```run lern/lgui2/audio-1```.

A window will appear with a "Stop and Play" button. Click the button to stop the playing sound (if any), and play the sound of applause. Click it as many times as you'd like.

End the script with ```end audio-1``` when finished.

## LGUI2 Package ```audioVoices```
LGUI2 Packages can specify ```audioVoices```, an object containing a set of voice definitions, like so:

```
"audioVoices": {
    "ui sound": {}
}
```

Each named object defined within the ```audioVoices``` object will result in an audio voice with that name. Each audio voice can in turn specify ```volume``` either as a single number, or an array of numbers for per-channel volumes.

## LGUI2 Package ```audioStreams```
LGUI2 Packages can specify ```audioStreams```, an object containing a set of stream definitions, like this:

```
"audioStreams": {
    "crowd-claps": {
        "filename": "../Assets/Audio/crowd-claps.wav"
    }
}
```

Each named object defined within the ```audioStreams``` object will result in an audio stream with that name, referencing the given ```filename```. The ```filename``` is relative to the JSON file itself.

## ```audio``` event handler
An ```audio``` event handler is specified like so:

```
{
    "type": "audio",
    "streamName": "crowd-claps",
    "voiceName": "ui sound"
}
```

The definition and behavior of an ```audio``` event handler is identical to the ```audio.playstream``` task (see [LMAC/audio-1.md](../LMAC/audio-1.md)).


The ```voiceName``` specifies which voice to use, and the ```streamName``` specifies which stream to play.

If provided, a ```flush``` property specifies whether to stop the voice and clear its queue before playing the specified stream. **By default if not specified, ```flush``` is ```true```**.

If no ```streamName``` is provided, the behavior is to stop the voice. As noted above, if ```flush``` is not provided, the queue is also cleared.