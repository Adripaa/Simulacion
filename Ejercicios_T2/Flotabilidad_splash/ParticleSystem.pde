class ParticleSystem {
  ArrayList<Particle> particles;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }

  void explode(float x, float y) {
    for (int i = 0; i < 100; i++) {
      Particle p = new Particle(x, y);
      particles.add(p);
    }
  }

  void update() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  void display() {
    for (Particle p : particles) {
      p.display();
    }
  }
}

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(float x, float y) {
    position = new PVector(x, y);
    velocity = PVector.random3D();
    velocity.mult(random(2, 5));
    acceleration = new PVector(0, 0.08);
    lifespan = 300;
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  void display() {
    stroke(0, lifespan);
    strokeWeight(1);
    fill(93, 193, 185, lifespan);
    //noStroke();
    ellipse(position.x, position.y, 8, 8);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
