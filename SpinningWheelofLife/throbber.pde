class ParticleSystem {
  ArrayList<Particle> particles;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }

  void addParticle(String getip, int getport) {
    particles.add(new Particle(getip, getport));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      println(i);
      //checktime();
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

// A simple Particle class

class Particle {
  String finalip;
  int finalport;
  int size;
  color colorbuffer;
  PVector calpos;
  PVector location;
  float alpha;  //fading rate
  
  Particle(String tempip, int tempport) {
   
    finalip = tempip;
    finalport = tempport;
    calpos = new PVector(0,35);   //initial position 
    alpha = 255.0;
    size = 22;
    colorbuffer = color (240,240,240);    
    counter++; 
    println("***" + counter + " packets: " + finalip);   
    
}
  void run() {
    update();
  }
  
  // Method to update location
  void update() {
    alpha -=10;
    noStroke();
    fill(colorbuffer, alpha);
    smooth();
    pushMatrix();
    translate(width/2, height/2);
    float cir = (360/9)*(counter%9);    
    rotate(radians(cir));
    ellipse(calpos.x,calpos.y,size,size);
    popMatrix();   
  }

  // Is the particle still useful?
  boolean isDead() {
    if (alpha < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
