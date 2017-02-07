# The Spinning Wheel of Life (still work-in-progress)

The Spinning Wheel of Life, with a running throbber, responses to technological networks, data transmission and material substrates in real time. The visual cultural icon represnts the nature of the Internet which is something not very stable, with ruptures, gaps and glitches, as part of the digital culture fundamentally. 

While a throbber may convey a negative connotation with the need of waiting for an unknowable time. The time may be considered as unproductive or as a waste of time. Instead of having an animated gif, a throbber is redesigned with which it spins as the machine receives data and stores them in a buffer for immediate retrieval, resulting in an unusual spinning, beyond what the term "throb" is denoted. From the microscopic time interval of digital signal processing to the planetary scale of data capitalization, the piece invites for a speculation of this cultural icon beyond the slowness of network and explores the micro-temporality of streams.
 
# How it works
A software is made in processing, constantly listening to a range of IP addresses in real-time. Each display of an ellipse is subjected to network packet arrival. A series of the ellipse will form a noticeable and animated icon - throbber. 

#Credits
Carnivore Library: http://r-s-g.org/carnivore

#Playlist configuration
http://siusoon.net/thespinningwheeloflife/ <br>
*An html that set the playlist with loop and autoplay parameters.
*the choice of playlist is subjected to the internet speed. If it is relatively slow, it is better to have lightweight playlist. 
lightweight Example: PLk6nqLYChSfG7N0kUWyKq_zraDMrWCDun  or Lk6nqLYChSfFhLiaf45XmnhfkcSeFSuBJ

#Procedures on MAC
1/ Settings on mac terminal: first open a Terminal and execute this commmand: sudo chmod 777 /dev/bpf* 
   (must be done each time you reboot your mac)
   
2/ Install a youtube ad blocker in your firefox: https://addons.mozilla.org/en-US/firefox/addon/youtube-enhancer-plus/

3/ go to the playlist 

4/ Turn on Processing and run Spining Wheel of Life

#Procedures on Pi
1/ use 'sudo processing' to turn on processing

#Configurable items in the program
1/ self ip address (use the command 'ifconfig' in Pi)

2/ time configuration: "frameRate", alpha value in void draw > fill,  delaytime on packet arrival, decremental alpha value of throbber's ellipses

3/ block youtube ad > update Epiphany > disable ad (preference) or use Midori (check preference > cache and extension too)

4/ never accept cookies: Open Web ▸ Preferences ▸ Privacy.

5/ go to the playlist > choose the low resolution one

6/ MTU settings to adjust packets size 'sudo ifconfig eth0 mtu 1200 up' (between 1200-1500)

*additional configuration might be required for "delaytime", "frameRate" and "alpha", because the program behaves differently with a different machine and site. 

#Tested configurations
- Processing 3.0 + Mac OS 10.10.5
- Processing 3.2.1 + Pi 3 Model B + Debian_version 8.0
- Mobile Internet network 4G (Lite) 

*Pi 2 doesn't work - performance issue

