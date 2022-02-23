objectdef myController
{
    variable taskmanager TaskManager=${LMAC.NewTaskManager["myTaskManager"]}
    
    method Shutdown()
    {
        TaskManager:Destroy
    }

    method RequestURLJSON(string url)
    {
        variable jsonvalue joTask
        joTask:SetValue["$$>
            {
                "type":"webrequest",
                "as":"json",
                "object":"MyController",
                "method":"OnRequestComplete",
                "url":${url.AsJSON~}
            }
            <$$"]
            
        TaskManager:BeginTask["${joTask.AsJSON~}"]
    }

    method OnRequestComplete()
    {
        echo myController:OnRequestComplete ${Context(type)} state=${Context.State} result=${Context.Result}
    }

}

variable(global) myController MyController

function main()
{
    MyController:RequestURLJSON["https://raw.githubusercontent.com/LavishSoftware/LERN/master/LGUI2/1.json"]

    while 1
        waitframe
}