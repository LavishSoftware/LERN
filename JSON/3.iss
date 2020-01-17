function main()
{
    variable jsonvalue fileValue
    fileValue:ParseFile["example.json"]

    echo "${fileValue~}"
}
