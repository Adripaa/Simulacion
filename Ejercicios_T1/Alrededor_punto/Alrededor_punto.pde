float dt = 0.1;
PVector center;
float radius;
float angle = 0; // Ángulo inicial
float speed = TWO_PI;  // Velocidad angular (una vuelta por segundo)

void setup(){
  size(600,600);
  radius = 150;
  center = new PVector(width/2, height/2);
}

void draw(){
  background(255);
  
  // Calculamos la posición de la pelota en la órbita
  float x = center.x + radius * cos(angle);
  float y = center.y + radius * sin(angle);
  
  // Punto central
  fill(0);
  ellipse(center.x, center.y, 5, 5);
  
  // Pelota
  fill(125, 0, 200);
  ellipse(x, y, 40, 40);
  
  // Incrementamos el ángulo para animar la órbita
  angle += speed / 100;
}
