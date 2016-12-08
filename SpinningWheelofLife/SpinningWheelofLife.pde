import java.util.Iterator;
import org.rsg.carnivore.*;
import org.rsg.carnivore.net.*;
import org.rsg.lib.Log;

int size = 22;
String selfip = "192.168.1.145";  //check selfip
int counter = 0;
ParticleSystem ps;
String packets[];

void setup() {
  background(0,0,0, 80);
  frameRate(10); //100, max 1000, min 10 
  size(400,400);
  //fullScreen(P3D);
  ps = new ParticleSystem();
  smooth();
  CarnivoreP5 p = new CarnivoreP5(this);
}

void draw() {
 fill(0,0,0, 80);
 rect(0, 0, width, height); 
 ps.run();
}

synchronized void packetEvent(CarnivorePacket p){
  
    String getip = p.receiverAddress.ip.toString();
    String getip2= getip.substring(1,12); 
    String []m1 = match(selfip,getip2);         
    if (m1 !=null) {
          ps.addParticle(p.senderAddress.toString(), p.senderPort);    
          String protocol = p.strTransportProtocol.toString();
          println("(" + p.strTransportProtocol + " packet) " + p.dateStamp() + " " + p.senderSocket() + " > " + p.receiverSocket());
          println("Payload: " + p.ascii());
          println("---------------------------\n");
          delay(200);  //slow down each data packet arrival at the same rate
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
