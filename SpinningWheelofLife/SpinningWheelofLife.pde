import org.rsg.carnivore.*;
import org.rsg.carnivore.net.*;
import org.rsg.lib.Log;

//cat video: https://www.youtube.com/embed?listType=playlist&list=PLk6nqLYChSfG7N0kUWyKq_zraDMrWCDun&loop=1&autoplay=1
//8 bit video: https://www.youtube.com/watch?v=zTo_YTUtDSk&list=PLk6nqLYChSfFhLiaf45XmnhfkcSeFSuBJ&loop=1&autoplay=1
int size = 22;
//String selfip = "192.168.43.160";  //check selfip
String selfip = "10.143.244.172";  //check selfip
String [] targetip= {"64.18.0.0", "64.233.160.0", "66.102.0.0","66.249.80.0","72.14.192.0","74.125.0.0", "173.194.0.0","207.126.144.0", "209.85.128.0", "216.58.208.0", "216.58.212.142", "216.239.32.0", "216.58.197.97"};  //youtube ips range
//private addr list: http://www.ip-tracker.org/locator/ip-lookup.php?ip=172.30.8.132
String[] m2;
int counter = 0;
PacketSystem ps;
String packets[];
//ip related
String getip;
String senderip;
boolean senderipcheck;
String selectedip ;
int addpacket;
//time related
float m;
float h;

void setup() {
  background(0);
  frameRate(50);
  size(400,400);
  //fullScreen(P3D);
  ps = new PacketSystem();
  CarnivoreP5 p = new CarnivoreP5(this);
  smooth();
}

void draw() {
 fill(0,0,0,30); //set the visual effect - leave trace
 rect(0, 0, width, height); 
 ps.go();
}

synchronized void packetEvent(CarnivorePacket p){
    getip = p.receiverAddress.ip.toString();
    if (selfip.equals(getip.substring(1, selfip.length()+1)) == true) {     
      senderip = p.senderAddress.ip.toString();
      senderipcheck = false;
      for (int i = 0; i < targetip.length; i++) {
         selectedip = targetip[i].substring(0,5);
         m2 = match(senderip,selectedip);       
         if (m2 !=null) {  //with match
           senderipcheck = false;           
           m2 = null;
         } else {
           senderipcheck = true;
         } 
      }
     addpacket= int(random(2));
       if ((senderipcheck) && (addpacket==1)) {
          counter++;
          ps.addPacket(p.senderAddress.toString(), p.senderPort);    
          println("(" + p.strTransportProtocol + " packet) " + p.dateStamp() + " " + p.senderSocket() + " > " + p.receiverSocket());
          //println("Payload: " + p.ascii());
          delay(25);  //50-200: slow down each data packet arrival at the same rate > more for visual aesthetics (but during the period no packet will be received because of the use of delay syntax)
       }
    
 }
}

void checktime() { //for debug purpose
  m = minute();
  h = hour();
 println("Time " + h + ":" + m);
}

/*
void keyPressed() {
 saveFrame(); 
}
*/
