objectdef audio_example
{
    variable taskmanager TaskManager=${LMAC.NewTaskManager["example task manager"]}
    method Initialize()
    {
        ; add a voice. This is what will make the sound for us
        Audio:AddVoice[music]

        ; add an audio stream. This is a sound that a voice can make.
        Audio:AddStream[manic in repose,"..\\Assets\\Audio\\Cagey_House_-_07_-_Manic_in_Repose.mp3"]

        ; play some music
        TaskManager:BeginTask["$$>
        {
            "type":"audio.playstream",
            "voiceName":"music",
            "streamName":"manic in repose"
        }
        <$$"]

        ; Drop the volume, then pan between left/right a handful of times
        TaskManager:BeginTask["$$>
        {
            "type":"chain",
            "tasks":[
                {
                    "type":"audio.setvolume",
                    "duration":5.0,
                    "voiceName":"music",
                    "volume":[0.1,0.1]
                },
                {
                    "type":"audio.setvolume",
                    "duration":5.0,
                    "voiceName":"music",
                    "volume":[1.0,0.1]
                },
                {
                    "type":"audio.setvolume",
                    "duration":5.0,
                    "voiceName":"music",
                    "volume":[0.1,1.0]
                },
                {
                    "type":"audio.setvolume",
                    "duration":5.0,
                    "voiceName":"music",
                    "volume":[1.0,0.1]
                },
                {
                    "type":"audio.setvolume",
                    "duration":5.0,
                    "voiceName":"music",
                    "volume":[0.1,1.0]
                },
                {
                    "type":"audio.setvolume",
                    "duration":5.0,
                    "voiceName":"music",
                    "volume":[1.0,0.1]
                },
                {
                    "type":"audio.setvolume",
                    "duration":5.0,
                    "voiceName":"music",
                    "volume":[0.1,1.0]
                },
                {
                    "type":"audio.setvolume",
                    "duration":5.0,
                    "voiceName":"music",
                    "volume":[1.0,0.1]
                },
                {
                    "type":"audio.setvolume",
                    "duration":5.0,
                    "voiceName":"music",
                    "volume":[0.1,1.0]
                }
            ]
        }
        <$$"]

    }

    method Shutdown()
    {
        TaskManager:Destroy
    }
}

variable(global) audio_example AudioExample

function main()
{
    while 1
        waitframe
}