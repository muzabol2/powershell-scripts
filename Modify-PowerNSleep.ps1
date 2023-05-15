## Power & Sleep

# dc - on battery
# ac - plugged in

# Turn off the dispaly: 
Powercfg /Change monitor-timeout-dc 5
Powercfg /Change monitor-timeout-ac 10

# Put the computer to sleep:
Powercfg /Change standby-timeout-dc 15
Powercfg /Change standby-timeout-ac 360
