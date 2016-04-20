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
  float alpha;
  
  Particle(String tempip, int tempport) {
   
    finalip = tempip;
    finalport = tempport;
    calpos = new PVector(0,35);   //initial position
    alpha = 255.0;
    size = 22;
    colorbuffer = color (240,240,240);
    
    //transformation of buffer start (in the form of ellipse)
    counter++; 
    println(counter + " packets: " + finalip);    
    //calculate the position of dots   
    pushMatrix();
    translate(width/2, height/2, 0);
    float cir = 360/9*(counter%9);
    rotate(radians(cir));
    float x = modelX(calpos.x, calpos.y, 0);
    float y = modelY(calpos.x, calpos.y, 0);
    popMatrix();
    
    location = new PVector(x, y);  //where it is
    
  }
  
  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    alpha -= 10.0;  //quicker to fade out
  }

  // Method to display
  void display() {
    noStroke();
    fill(colorbuffer,alpha);
    smooth();
    ellipse(location.x,location.y,size,size);

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
