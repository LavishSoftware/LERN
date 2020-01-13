objectdef fruit
{
    variable string Name

    method Initialize(string initialName="Apple")
    {
        This:SetName["${initialName~}"]

        echo Fruit Initialize: "${Name}"
    }

    method Shutdown()
    {
        echo Fruit Shutdown: "${Name}"
    }

    method SetName(string newName)
    {
        Name:Set["${newName~}"]
    }

    member ToText()
    {
        return "${Name~}"
    }
}

objectdef banana inherits fruit
{
    method Initialize()
    {
        This(fruit):Initialize["Banana"]
    }
}

objectdef cherry inherits fruit
{
    method Initialize()
    {
        This(fruit):Initialize["Cherry"]
    }

    member ToText()
    {
        return "Override: ${Name~}"
    }
}

function main()
{
    variable fruit FruitA
    variable banana FruitB
    variable cherry FruitC

    echo "FruitA=${FruitA~}"
    echo "FruitB=${FruitB~}"
    echo "FruitC=${FruitC~}"
}   