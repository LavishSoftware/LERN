objectdef lgui2_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[combobox-1.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[combobox-1.json]
    }

    method OnSelectionChanged()
    {
        echo OnSelectionChanged: ${Context(type)} SelectedItem.Index=${Context.Source.SelectedItem.Index} Data=${Context.Source.SelectedItem.Data}
    }
}

variable(global) lgui2_controller LGUI2Controller
 
function main()
{
    while 1
        waitframe
}