objectdef fruit
{
    variable string Name="Apple"
    variable string Color="Red"
}

function main()
{
    variable fruit WhatFruit="hi"
    
    echo Name: ${WhatFruit.Name}
    echo Color: ${WhatFruit.Color}
}