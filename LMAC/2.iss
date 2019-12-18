; This is the basic LMAC Controller pattern.

; here we do mostly the same things as example 1, but within an objectdef, and with a custom Task Type instead of the built-in "ls1.echo".
; our "custom.echo" will do the same thing as "ls1.echo", with some additional output for debuggging

objectdef lmac_controller
{
    ; a Task Manager is used to manage a set of executing Tasks, on your behalf
    variable taskmanager TaskManager=${LMAC.NewTaskManager["example task manager"]}

    method Initialize()
    {
        ; we can add custom Task Types like this. it's a lot like an LGUI2 event handler.

        ; LMAC has a MEMBER called NewTaskType, which gives a tasktype object.
        ; to use a MEMBER instead of a METHOD, we need a command to use it with. The "noop" command -- short for NO OPERATION -- does nothing on its own.
        noop ${LMAC.NewTaskType["$$>
        {
            "name":"custom.echo",
            "object":"LMACController",
            "method":"Task_Echo"
        }
        <$$"]}

        ; after it's added, we can run a task that uses our custom type
        This:HelloWorld
    }

    method HelloWorld()
    {
        ; begin a task that uses custom.echo to output "Hello World!"
        TaskManager:BeginTask["$$>
        {
            "type":"custom.echo",
            "output":"Hello World!"
        }
        <$$"]
    }

    ; this is the "callback" method for our "custom.echo" Task Type. it's called repeatedly, to control any running "custom.echo" task
	method Task_Echo()
	{
        ; Context is provided with a taskpulseargs object. 
        /*

Members of type taskpulseargs
--------------------
Task      Timestamp ElapsedMS TaskState Error 

Methods of type taskpulseargs
--------------------
SetError 

        */

        ; Context.TaskState will tell us to Start, Continue, or Stop
		switch ${Context.TaskState}
		{
		case Start
            ; the task is now starting. 
            ; do any per-Task initialization now
	   
            ; here we simply echo the values we're given via Context
        	echo Task_Echo: ${Context(type)} ${Context.Timestamp} ${Context.ElapsedMS} ${Context.Task} ${Context.TaskState} ${Context.Task.Args}

            ; this task should just echo and Stop
            echo "${Context.Task.Args[output].Escape}"

            ; use Context.Task:Stop to force the Task to Stop (such as for an always-instant Task, like this one)
            ; if forcing the Task to Stop due to an error condition, use Context:SetError[description] prior to Stop.
            ; here there is no error, we are just stopping.
    		Context.Task:Stop
		break        
        case Continue
            ; the task is in the normal, running state, and should continue as normal...

            ; this task does not Continue due to the Context.Task:Stop under Start.
        break
        case Stop
            ; the task is now stopping. if due to an error, then Context.Error should already have a value (e.g. because of Context:SetError[description])
            
            ; do any per-Task cleanup now.
        break
		}
	}

    method Shutdown()
    {
        TaskManager:Destroy
    }
}

variable(global) lmac_controller LMACController

function main()
{
    while 1
        waitframe
}