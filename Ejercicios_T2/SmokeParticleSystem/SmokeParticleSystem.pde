/**
 * Smoke Particle System
 * by Daniel Shiffman.
 *
 * A basic smoke effect using a particle system. Each particle
 * is rendered as an alpha masked image.
 */

ParticleSystem ps;

void setup() {
  size(640, 360);
  PImage img = loadImage("texture.png");
  ps = new ParticleSystem(0, new PVector(width/2, height-60), img);
}

void draw() {
  background(0);

  ps.run();
  for (int i = 0; i < 2; i++) {
    ps.addParticle();
  }

}
