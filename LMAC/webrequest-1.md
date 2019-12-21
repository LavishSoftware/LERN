# LERN/LMAC/webrequest-1

This example introduces the ```webrequest``` task type. For an introduction to Web Requests, see [/Web/1.md](../Web/1.md)

Open the file [webrequest-1.iss](webrequest-1.iss), and run the script with ```run lern/lmac/webrequest-1```.

The script will pull and output a JSON file (without saving it) from the online LERN repository.

End the script with ```end webrequest-1``` when finished. 

## The ```RequestURLJSON``` wrapper method
The controller object defined in this example provides its own wrapper method to begin a ```webrequest``` task, given a URL. It's then used like so:
```
MyController:RequestURLJSON["https://raw.githubusercontent.com/LavishSoftware/LERN/master/LGUI2/1.json"]
```

## ```webrequest``` task
A Web Request such as a http GET or POST request can be issued with a ```webrequest``` task, which may be defined like this:
```
 {
    "type":"webrequest",
    "url":"https://raw.githubusercontent.com/LavishSoftware/LERN/master/LGUI2/1.json"
    "as":"json",
    "object":"MyController",
    "method":"OnRequestComplete",
}
```

The ```url``` specifies the URL to access, and the ```as``` specifies whether to interpret and provide the result as ```json```, ```string```, ```binary```, or ```file```. 

If ```"as":"file"``` is specified, then a ```file``` property must also specify the output filename, for example  ```"file":"output.txt"```.

If ```object``` and ```method``` are specified, then the method will be used as a **callback** when the task completes. The method will be provided a ```webrequest Context```, which can be accessed for its ```Result```. See [/Web/1.md](../Web/1.md) for more on ```webrequest``` objects.


# References
* [```webrequest``` object type documentation](https://www.lavishsoft.com/wiki/index.php/ISKernel:webrequest_(Object_Type))