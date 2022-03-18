objectdef combobox1_controller
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

variable(global) combobox1_controller ComboBox1Controller
 
function main()
{
    while 1
        waitframe
}