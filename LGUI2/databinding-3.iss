objectdef databinding3_controller
{  
    method Initialize()
    {
        LGUI2:LoadPackageFile[databinding-3.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[databinding-3.json]
    }

    member:string GetElementList()
    {
        return "$$>[
            {
                "type":"textblock",
                "text":"John",
                "color":"#ffff00"
            },
            {
                "type":"textblock",
                "text":"Jane",
                "color":"#00ffff"
            },
            {
                "type":"textblock",
                "text":"Alice",
                "color":"#ff00ff"
            }
            ]<$$"        
    }

    
}

variable(global) databinding3_controller DataBinding3Controller
 
function main()
{
    while 1
        waitframe
}