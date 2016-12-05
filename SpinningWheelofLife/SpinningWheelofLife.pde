import java.util.Iterator;
import org.rsg.carnivore.*;
import org.rsg.carnivore.net.*;
import org.rsg.lib.Log;

int size = 22;
String [] targetip= {"64.18.0.0", "64.233.160.0", "66.102.0.0","66.249.80.0","72.14.192.0","74.125.0.0", "173.194.0.0","207.126.144.0", "209.85.128.0", "216.58.208.0", "216.58.212.142", "216.239.32.0", "172.24.115.27", "216.58.197.97", "172.30.8.132"};  //youtube ips
int counter = 0;
ParticleSystem ps;
// Flag for online/offline modes.
boolean isOnline = true;
String packets[];
HashMap nodes = new HashMap();

void setup() {
  background(0,0,0, 80);
  frameRate(10); //100, max 1000, min 10 
  size(800,800);
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
  
  if(isOnline) {
    String getip = p.senderAddress.ip.toString();
    String getip2= getip.substring(1,8);  //the first character is "/" 
    for (int i=0; i<targetip.length;i++) {
      String []m1 = match(targetip[i],getip2);
       if (m1 !=null) {
          //nodes.put(p.senderAddress.toString(), new Particle(p.senderAddress.toString(), p.senderPort));
          ps.addParticle(p.senderAddress.toString(), p.senderPort);    
          delay(100);  //slow down each data packet arrival at the same rate
          i = targetip.length;
      }else{
        if (i == targetip.length-1) {
          print("not match " + getip + " " + "\n");
        }
     }      
    
  } 
  
 }
}
void keyPressed() {
 saveFrame(); 
}
