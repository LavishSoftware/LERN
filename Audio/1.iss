function main()
{
    ; add a voice. This is what will make the sound for us
    Audio:AddVoice[music]

    ; add an audio stream. This is a sound that a voice can make.
    Audio:AddStream[manic in repose,"..\\Assets\\Audio\\Cagey_House_-_07_-_Manic_in_Repose.mp3"]

    ; Set volume to 1.0 on left channel, 0.2 on right channel. 1.0 is normal volume, 0 silence. higher than 1.0 will amplify.
    Audio.Voice[music]:SetVolume[1.0,0.2]

    ; play some music
    Audio.Voice[music]:PlayStream[manic in repose]

    ; wait 5 seconds
    wait 50

    ; stop the music, and clear the queue ("flush")
    Audio.Voice[music]:Stop:ClearQueue
}
