float dt = 0.1;
PVector p, vel, r, altura, initialP;
boolean press = false;
float lineLength = 80; // Longitud de la línea

void setup() {
  size (600, 600);
  p = new PVector(width/2, height - 22);
  initialP = p.copy(); 
}

void draw() {

  background(255);

  //Particula p
  stroke(0);
  fill(0, 0, 255);
  ellipse(p.x, p.y, 40, 40);
  
  // Dibujar línea
  PVector mousePos = new PVector(mouseX, mouseY);
  PVector lineDirection = PVector.sub(mousePos, initialP);
  lineDirection.normalize();
  lineDirection.mult(lineLength);
  PVector lineEnd = PVector.add(initialP, lineDirection);
  line(initialP.x, initialP.y, lineEnd.x, lineEnd.y);

  if ( press == true) {

    

    p.add(PVector.mult(vel, dt));
    if (p.y < 0 || p.x < 0 || p.x > width)
    {
      press = false;
    }
  } 
  else {
    stroke(0);
    fill(0, 0, 255);
    p = new PVector(width/2, height - 22);
    ellipse(p.x, p.y, 40, 40);
  }
}

void mousePressed() {
  r = new PVector (mouseX, mouseY);
  vel = PVector.sub(r, p);
  vel.normalize();
  vel.mult(70);
  press = true;
}
