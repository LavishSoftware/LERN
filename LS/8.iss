objectdef fruit
{
    variable string Name="Apple"
    variable string Color="Red"

    member ToText()
    {
        return "${Name~} ${Color~}"
    }
}

function main()
{
    variable fruit WhatFruit

    echo WhatFruit: ${WhatFruit}
    ; ==> WhatFruit: Apple Red

    echo WhatFruit.Name.Length: ${WhatFruit.Name.Length}
    ; ==> WhatFruit.Name.Length: 5
}   