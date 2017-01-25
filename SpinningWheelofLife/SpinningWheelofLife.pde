import java.util.Iterator;
import org.rsg.carnivore.*;
import org.rsg.carnivore.net.*;
import org.rsg.lib.Log;

//cat video: https://www.youtube.com/embed?listType=playlist&list=PLk6nqLYChSfG7N0kUWyKq_zraDMrWCDun&loop=1&autoplay=1
//8 bit video: https://www.youtube.com/watch?v=zTo_YTUtDSk&list=PLk6nqLYChSfFhLiaf45XmnhfkcSeFSuBJ&loop=1&autoplay=1
int size = 22;
//String selfip = "192.168.43.160";  //check selfip
String selfip = "192.168.1.227";  //check selfip

int counter = 0;
PacketSystem ps;
String packets[];

void setup() {
  background(0);
  frameRate(100);
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
    String []m1 = match(selfip,getip2);         
    if (m1 !=null) {
          counter++;
          ps.addPacket(p.senderAddress.toString(), p.senderPort);    
          println("(" + p.strTransportProtocol + " packet) " + p.dateStamp() + " " + p.senderSocket() + " > " + p.receiverSocket());
          println("Payload: " + p.ascii());
          println("---------------------------\n");
          delay(50);  //50-200: slow down each data packet arrival at the same rate > more for visual aesthetics (but during the period no packet will be received because of the use of delay syntax)
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
