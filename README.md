# The-Spinning-Wheel-of-Life
The project challenges the perception of a throbber that is usually understood as a transitional object, waiting for content delivers on a screen. Forcing to focus on the spinning wheel with a networked music stream, the project asks: how might we engage with a throbber beyond the negative connotations of waitings, frustrations and annoyance in contemporary software culture? 

# How it works
A software is made in processing, constantly listening to a range of IP addresses in real-time. Each display of an ellipse is subjected to network packet arrival. A series of the ellipse will form a noticeable and animated icon - throbber. 

#Credits
Carnivore Library: http://r-s-g.org/carnivore

#Procedures
1/ Settings on mac terminal: first open a Terminal and execute this commmand: sudo chmod 777 /dev/bpf* 
   (must be done each time you reboot your mac)
   
2/ Turn on Processing and run SpiningWheelofLife

3/ Go to youtube and get a playlist (8 bits video: https://www.youtube.com/watch?v=dXb3XXi9Xww&list=PLzjkiYUjXuevVG0fTOX4GCTzbU0ooHQ-O&index=12)

#Configurable items
1/ delay time

2/ list of ip address that you want to track (youtube currently)

3/ alpha -> the fade in/out speed

#Tested configurations:
- Processing 3.0 + Mac OS 10.10.5
