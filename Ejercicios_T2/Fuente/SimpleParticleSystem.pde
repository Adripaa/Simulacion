/**
 * Simple Particle System
 */

ParticleSystem ps;

void setup() {
  size(640, 360);
  ps = new ParticleSystem(new PVector(width/2, height - 5));
}

void draw() {
  background(0);
  ps.addParticle();
  ps.run();
}

void keyPressed()
{
  if (key == 'r' || key == 'R')
  {
    setup();
  }
 
}
