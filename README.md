# Gas Station Simulator


## For Competitors
Who thought we could make boring everyday tasks like pumping gas more fun? You might even find a few 'lost' credit cards along the way.

## How to Solve
1. Use the mouse to move the character around the gas station
1. stand next to a gas pump and click the terminal icon on the phone screen and type "scan bluetooth"
1. Repeat the last step until you get a result for HC-01
1. Note the mac address of HC-01, it should be F3:00:A4:D2:AF:E9
1. type "connect F3:00:A4:D2:AF:E9" into the phone terminal
1. now you are "connected" to the skimmer scanner
1. Research into skimmer scanners should have revealed this article from SparkFun https://learn.sparkfun.com/tutorials/gas-pump-skimmers
1. following the information on their site typing @[x][y] into the HC-01 should return a character in the memory of the scanner.
1. Repeat the last step until you find the flag.




# Flag

MCA-flag is: MCA{201411291500924149303?}


