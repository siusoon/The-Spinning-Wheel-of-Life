# The Spinning Wheel of Life
The project challenges the perception of a throbber that is usually understood as a transitional object, waiting for content delivers on a screen. By having a music stream that runs in the background, the throbber appears not because of waiting for data arrival, but, instead, it spins as the machine receives data and stores them in a buffer for immediate retrieval. The project asks: By subverting the usual functioning of a throbber, how might we engage with a throbber in a different way? Beyond the negative connotations of waitings, frustrations and annoyance, how might we reflect on a throbber, also known as the spinning wheel of death, that has become a cultural object and used commonly in contemporary software culture? 

# How it works
A software is made in processing, constantly listening to a range of IP addresses in real-time. Each display of an ellipse is subjected to network packet arrival. A series of the ellipse will form a noticeable and animated icon - throbber. 

#Credits
Carnivore Library: http://r-s-g.org/carnivore

#Procedures on MAC
1/ Settings on mac terminal: first open a Terminal and execute this commmand: sudo chmod 777 /dev/bpf* 
   (must be done each time you reboot your mac)
   
2/ Install a youtube ad blocker in your firefox: https://addons.mozilla.org/en-US/firefox/addon/youtube-enhancer-plus/

3/ Firefox> Go to youtube and get a playlist (e.g 8 bits video game music: http://bit.ly/1ppETHQ)

4/ Turn on Processing and run SpiningWheelofLife

#Procedures on Pi
1/ use 'sudo ./processing' to turn on processing

#Configurable items in the program
1/ delay time via "frameRate" and "delaytime"

2/ list of ip address that you want to track (youtube currently)

3/ alpha in throbber tab -> the fade in/out speed

* additional configuration might be required for "delaytime", "frameRate" and "alpha", because the program behaves differently with a different machine and site. 
* 
#Tested configurations
- Processing 3.0 + Mac OS 10.10.5
- Processing 3.2.1 + Pi 3 Model B + Debian_version 8.0
