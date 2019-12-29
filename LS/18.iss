function main(string FruitName)
{
    if ${FruitName.Length}==0
    {
        echo "Please pass the name of a fruit as a parameter!"
        return
    }

    switch ${FruitName}
    {
        case Apple
            echo "Known Fruit: Apple!"
            break
        case Banana
            echo "Known Fruit: Banana!"
            break
        case Cherry
            echo "Known Fruit: Cherry!"
            break
        default
            echo "Unknown Fruit? ${FruitName~}"
            break
    }
}