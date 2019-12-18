; LMAC is short for LavishMachine
; LavishMachine is a Virtual Machine integrated into LavishScript. Currently it handles running "Tasks".

function main()
{
    ; a Task Manager is used to manage a set of executing Tasks, on your behalf
    variable taskmanager TaskManager=${LMAC.NewTaskManager["example task manager"]}

    TaskManager:BeginTask["$$>
        {
            "type":"ls1.echo",
            "output":"Hello World!"
        }
        <$$"]

    ; some tasks (not ls1.echo) may execute over time.

    ; this script will wait half a second ("wait" is in tenths of seconds) to allow tasks to complete within that time...
    wait 5

    ; destroying the Task Manager will Stop any running tasks it is managing. here, our task is already done.
    TaskManager:Destroy

}