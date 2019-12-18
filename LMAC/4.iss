; this example is the same as 3, but adds error handling for custom.slideX tasks

objectdef lmac_controller
{
    ; let's give ourselves a variable to adjust over time.
    variable float X=123.456

    ; a Task Manager is used to manage a set of executing Tasks, on your behalf
    variable taskmanager TaskManager=${LMAC.NewTaskManager["example task manager"]}

    method Initialize()
    {
        This:AddTaskType["$$>
        {
            "name":"custom.slideX",
            "object":"LMACController",
            "method":"Task_SlideX"
        }
        <$$"]

        This:SlideX
    }

    method SlideX()
    {
        ; the "to" field is purposefully broken here to produce an error. remove the - to try again with no error.
        TaskManager:BeginTask["$$>
        {
            "type":"custom.slideX",
            "duration":1.5,
            "-to":234.567
        }
        <$$"]
    }

    method AddTaskType(string jsonData)
	{
		variable int64 id
		id:Set[${LMAC.NewTaskType["${jsonData.Escape}"].ID}]
		if ${id}
		{
			echo "LMACController: Task Type ${id} added: ${LMAC.TaskType[${id}].Name.Escape}"
		}
	}


    ; this is the "callback" method for our "custom.slideX" Task Type. it's called to control any "custom.slideX" task
	method Task_SlideX()
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

        ; Context.Task provides access to the running task instance
        /*

Members of type task
--------------------
Name                   Result                 FrameElapsedMS         IsInstant  
ID                     IsRunning              StartTimestamp         
Type                   RunningTime            LastFrameTimestamp     
TaskManager            RunningTimeMS          Duration               
Args                   FrameElapsed           DurationMS             

Methods of type task
--------------------
Start    Stop     Toggle   
        */

        ; use Context.Task:Stop to force the Task to Stop (such as for an always-instant Task, like this one)
        ; if forcing the Task to Stop due to an error condition, use Context:SetError[description] prior to Stop.


		switch ${Context.TaskState}
		{
		case Start
            ; the task is now starting. 
            ; do any per-Task initialization now
	   
            ; here we simply echo the values we're given via Context
        	echo Task_SlideX: ${Context(type)} ${Context.Timestamp} ${Context.ElapsedMS} ${Context.Task} ${Context.TaskState} ${Context.Task.Args}

            if !${Context.Task.Args.Has[to]}
            {
                Context:SetError["custom.slideX requires 'to'"]
                Context.Task:Stop
                return
            }


            ; we can put values of our own into Task.Args to use during task execution...
            Context.Task.Args:Set["original_x",${X}]

            ; let's also calculate the speed based on our duration
            if ${Context.Task.Duration}
            {
                Context.Task.Args:Set["speed_x", ${Math.Calc[ (${Context.Task.Args[to]}-${X}) / ${Context.Task.Duration} ]} ]
            }
            else
            {
                ; no duration specified, treat as instant.
                Context.Task:Stop
            }

		break        
        case Continue
            ; the task is in the normal, running state, and should continue as normal...
            
            ; Task.RunningTime provides the total time the Task has been executing, in seconds as a floating point.
            ; X = Original + (Speed * Time)
            X:Set[${Context.Task.Args[original_x]}+(${Context.Task.Args[speed_x]} * ${Context.Task.RunningTime})]

            echo Task_SlideX[Continue]: X=${X}
        break
        case Stop
            ; the task is now stopping. if due to an error, then Context.Error should already have a value (e.g. because of Context:SetError[description])            

            ; string.NotNULLOrEmpty will tell us if the string actually has a proper value. here, make sure Context.Error does NOT have a proper value.
            if !${Context.Error.NotNULLOrEmpty}
            {
                ; no error, let's set X to the final value. if it stopped early, it's not so much of a "slide" as a "warp" :)
                X:Set[${Context.Task.Args[to]}]
            }

            echo Task_SlideX[Stop]: X=${X}
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