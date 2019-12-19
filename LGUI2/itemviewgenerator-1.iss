objectdef lgui2_controller
{  
    method Initialize()
    {
        LGUI2:LoadPackageFile[itemviewgenerator-1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[itemviewgenerator-1.json]
    }

    method GetAudioStreamView()
    {
;        echo GetAudioStreamView ${Context(type)} ${Context.Args}
/* Context.Args example. These come from ${Audio.Streams}, which come from the "audioStreams" in itemviewgenerator-1.json
    {
        "filename":"C:/Windows/Media/ding.wav",
        "name":"ding"
    }
*/
        Context:SetView["$$>
        {
            "type":"itemview",
            "content":{
                "type":"dockpanel",
                "margin":[0,0,20,0]
                "children":[
                    {
                        "_dock":"left",
                        "type":"textblock",
                        "text":"${Context.Args[name]}"
                    },
                    {
                        "_dock":"right",
                        "type":"button",
                        "content":"Play",
                        "eventHandlers":{
                            "onPress":{
                                "type":"audio",
                                "voiceName":"ui sound",
                                "streamName":"${Context.Args[name]}"
                            }
                        }
                    }
                ]
            }
        }
        <$$"]
    }

    
}

variable(global) lgui2_controller LGUI2Controller
 
function main()
{
    while 1
        waitframe
}