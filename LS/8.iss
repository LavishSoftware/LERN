objectdef fruit
{
    variable string Name="Apple"
    variable string Color="Red"

    method SetName(string newName)
    {
        Name:Set["${newName~}"]
    }

    method SetColor(string newColor)
    {
        Color:Set["${newColor}"]
    }

    member ToText()
    {
        return "${Name} ${Color}"
    }
}

function main()
{
    variable fruit FruitA
    variable fruit FruitB

    echo ------------
    echo ** Before. 
    echo ** FruitA: ${FruitA}
    echo ** FruitB: ${FruitB}

    FruitB:SetName["Banana"]
    FruitB:SetColor["Yellow"]

    echo ------------
    echo ** After.
    echo ** FruitA: ${FruitA}
    echo ** FruitB: ${FruitB}
}   