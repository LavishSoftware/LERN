objectdef filepicker1_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[filepicker-1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[filepicker-1.json]
    }

    method OnFinalized()
    {        
        echo "OnFinalized ${Context.Source(type)}"
        if ${Context.Source.IsMultiselect}
            echo "Values=${Context.Source.Values~}"
        else
            echo "Value=${Context.Source.Value~}"
    }
}

variable(global) filepicker1_controller filepicker1Controller
 
function main()
{
    while 1
        waitframe
}