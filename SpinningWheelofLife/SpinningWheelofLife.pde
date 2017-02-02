import java.util.Iterator;
import org.rsg.carnivore.*;
import org.rsg.carnivore.net.*;
import org.rsg.lib.Log;

//cat video: https://www.youtube.com/embed?listType=playlist&list=PLk6nqLYChSfG7N0kUWyKq_zraDMrWCDun&loop=1&autoplay=1
//8 bit video: https://www.youtube.com/watch?v=zTo_YTUtDSk&list=PLk6nqLYChSfFhLiaf45XmnhfkcSeFSuBJ&loop=1&autoplay=1
int size = 22;
//String selfip = "192.168.43.160";  //check selfip
String selfip = "10.143.244.67";  //check selfip
String [] targetip= {"64.18.0.0", "64.233.160.0", "66.102.0.0","66.249.80.0","72.14.192.0","74.125.0.0", "173.194.0.0","207.126.144.0", "209.85.128.0", "216.58.208.0", "216.58.212.142", "216.239.32.0", "216.58.197.97"};  //youtube ips range
//private addr list: http://www.ip-tracker.org/locator/ip-lookup.php?ip=172.30.8.132

int counter = 0;
PacketSystem ps;
String packets[];

void setup() {
  background(0);
  frameRate(800);
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
  
    String getip = p.receiverAddress.ip.toString();
    String getip2= getip.substring(1,12); 
    String []m1 = match(selfip,getip2);  //send from outside to local
    String senderip = p.senderAddress.ip.toString();
    String senderip2= senderip.substring(1,10); 
    boolean senderipcheck = false;
    for (int i = 0; i < targetip.length; i++) {
       String selectedip = targetip[i].substring(0,5);
       String []m2 = match(senderip2,selectedip);       
       if (m2 !=null) {  //with match
         senderipcheck = false;
       } else {
         senderipcheck = true;
       } 
    }
   if ((m1 !=null) && (senderipcheck)) {
          counter++;
          ps.addPacket(p.senderAddress.toString(), p.senderPort);    
          println("(" + p.strTransportProtocol + " packet) " + p.dateStamp() + " " + p.senderSocket() + " > " + p.receiverSocket());
          //println("Payload: " + p.ascii());
          delay(15);  //50-200: slow down each data packet arrival at the same rate > more for visual aesthetics (but during the period no packet will be received because of the use of delay syntax)

    } 
 }

void checktime() { //for debug purpose
 float m = minute();
 float h = hour();
 println("Time " + h + ":" + m);
}

void keyPressed() {
 saveFrame(); 
}
