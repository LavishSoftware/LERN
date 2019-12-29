function main(int value=1)
{
    if ${value}<10
        echo ${value}. Warning: ${value} is less than 10
    elseif ${value}>90
        echo ${value}. Warning: ${value} is greater than 90
    else
        echo ${value}.
}
