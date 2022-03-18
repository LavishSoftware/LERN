objectdef combobox2_controller
{
    method Initialize()
    {
        LGUI2:LoadPackageFile[combobox-2.json]
    }

    method Shutdown()
    {
        LGUI2:UnloadPackageFile[combobox-2.json]
    }

    method OnSelectionChanged()
    {
        echo OnSelectionChanged: ${Context(type)} SelectedItem.Index=${Context.Source.SelectedItem.Index} Data=${Context.Source.SelectedItem.Data}
    }

    member PeopleItems()
    {
        return "[{\"type\":\"textblock\",\"text\":\"John\"},{\"type\":\"textblock\",\"text\":\"Jane\"}]"
    }
   
}

variable(global) combobox2_controller ComboBox2Controller
 
function main()
{
    while 1
        waitframe
}