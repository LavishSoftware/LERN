objectdef ldio_controller_kbm1
{
    method Initialize()
    {
        keyboard:SetListener[log]
        mouse:SetListener[log]
    }

    method Shutdown()
    {
        keyboard:SetListener[]
        mouse:SetListener[]
    }

}

variable ldio_controller_kbm1 LDIOController_KBM1
 
function main()
{       
    echo "this script will log keyboard/mouse input to the IS console until exited."
    echo "\ayendscript kbm-1\ax"
    while 1
        waitframe
}