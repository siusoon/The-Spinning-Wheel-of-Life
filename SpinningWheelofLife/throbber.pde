class PacketSystem {
  ArrayList<Packet> packets;

  PacketSystem() {
    packets = new ArrayList<Packet>();
  }

  void addPacket(String getip, int getport) {
    packets.add(new Packet(getip, getport));
  }

  synchronized void go() {
  
    for (int i = packets.size()-1; i >= 0; i--) {
      Packet p = packets.get(i); //not much live packets
      println(i);
      p.run();
      if (p.isDead()) {
        packets.remove(i);
      }
    
    }
  }
}


class Packet {
  String finalip;
  int finalport;
  int size;
  color colorbuffer;
  PVector calpos;
  PVector location;
  int getcount;
  float alpha;  //fading rate
  
  Packet(String tempip, int tempport) {
   
    this.finalip = tempip;
    this.finalport = tempport;
    this.calpos = new PVector(0,35);   //initial position 
    this.alpha = 250.0;
    this.size = 22;
    this.colorbuffer = color (240,240,240);    
    this.getcount = counter;
    println("***" + counter + " packets: " + finalip);   
}
  synchronized void run() {
    this.update();
  }
  
  // Method to update location
 synchronized void update() {
    this.alpha -=8;
    noStroke();
    fill(this.colorbuffer, this.alpha);
    smooth();
    pushMatrix();
    translate(width/2, height/2);
    float cir = (360/9)*(this.getcount%9); 
    rotate(radians(cir));
    ellipse(this.calpos.x,this.calpos.y,this.size,this.size);
    popMatrix();   
  }

  // Is the packet still useful?
  boolean isDead() {
    if (alpha < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
