import java.util.Iterator;
import org.rsg.carnivore.*;
import org.rsg.carnivore.net.*;
import org.rsg.lib.Log;

CarnivoreP5 c;

int size = 22;
String [] targetip= {"64.18.0.0", "64.233.160.0", "66.102.0.0","66.249.80.0","72.14.192.0","74.125.0.0", "173.194.0.0","207.126.144.0", "209.85.128.0", "216.58.208.0", "216.239.32.0"};  //youtube ips
//String [] targetip= {"93.184.220.127", "72.21.91.127"};  //soundcloud ips
int counter = 0;
ParticleSystem ps;
// Flag for online/offline modes.
boolean isOnline = true;
String packets[];
HashMap nodes = new HashMap();

void setup() {
  background(255,255,255, 80);
  frameRate(20);
  size(800,800, P3D);
  ps = new ParticleSystem();
  smooth();
  CarnivoreP5 c = new CarnivoreP5(this);
}

void draw() {
 fill(0,0,0, 80);
 rect(0, 0, width, height); 
 ps.run();
}


synchronized void packetEvent(CarnivorePacket p){
  
  if(isOnline) {
    String getip = p.senderAddress.ip.toString();
    String getip2= getip.substring(1,9);  //the first character is "/" 
    for (int i=0; i<targetip.length;i++) {
      String []m1 = match(targetip[i],getip2);
       
       if (m1 !=null) {
          //nodes.put(p.senderAddress.toString(), new Particle(p.senderAddress.toString(), p.senderPort));
          ps.addParticle(p.senderAddress.toString(), p.senderPort);    
          delay(120);
      }
      else
        print("not match ");
    }      
    
  } 
  
 }

void keyPressed() {
 saveFrame(); 
}
