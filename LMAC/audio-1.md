# LERN/LMAC/audio-1
This example introduces audio tasks. For an introduction to Audio, see **LERN/Audio/** such as [Audio/1.md](../Audio/1.md))

Open the file [audio-1.iss](audio-1.iss), and run the script with ```run lern/lmac/audio-1```.

Over a period of 50 seconds, music will be played at varying volume levels:
1. first dropping to 10% volume on left/right channels
2. then panning left and right several times
3. and then back down to 10%.

End the script with ```end audio-1``` when finished. Ending the script will stop the sound.

## ```audio.playstream``` task
An audio stream can be played on an existing audio voice with a ```audio.playstream``` task, which may be defined like this:

```
{
    "type":"audio.playstream",
    "voiceName":"music",
    "streamName":"tune",
    "playCount":6
}
```

The definition and behavior of an ```audio.playstream``` task is identical to an LavishGUI 2 ```audio``` event handler (see [LGUI2/audio-1.md](../LGUI2/audio-1.md)).

The ```voiceName``` specifies which voice to use, and the ```streamName``` specifies which stream to play.

If provided, a ```flush``` property specifies whether to stop the voice and clear its queue before playing the specified stream. **By default if not specified, ```flush``` is ```true```**.

The ```playCount``` can be provided to play the sound a given number of times, or set to ```-1``` to loop the sound forever. **If not provided, ```playCount``` is ```1```**.

If no ```streamName``` is provided, the behavior is to stop the voice. As noted above, if ```flush``` is not provided, the queue is also cleared.

## ```audio.setvolume``` task
To adjust the volume on an existing audio voice, use a ```audio.setvolume``` task, which may be defined like this:

```
{
    "type":"audio.setvolume",
    "duration":5.0,
    "voiceName":"music",
    "volume":[0.1,0.1]
}
```

As with the ```audio.playstream``` task, ```voiceName``` specifies which audio voice to adjust.

```volume``` may be a single number to set the volume on all channels, or an array of numbers to specify per-channel volumes on up to 32 audio channels.

```audio.setvolume``` can adjust the volume over time, by specifying a ```duration```. Do note that **when specifying ```duration```, floating point values are used differenly than integer values**. A ```duration``` value of ```5000``` (milliseconds) is the same as ```5.0``` (seconds).

