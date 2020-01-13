objectdef fruit
{
    variable string Name

    method Initialize(string initialName="Apple")
    {
        This:SetName["${initialName~}"]

        echo Fruit Initialize: "${Name~}"
    }

    method Shutdown()
    {
        echo Fruit Shutdown: "${Name~}"
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

function main()
{
    variable fruit FruitA
    variable fruit FruitB="Banana"
    variable fruit FruitC="Cherry"

    echo "FruitA=${FruitA~}"
    echo "FruitB=${FruitB~}"
    echo "FruitC=${FruitC~}"
}   