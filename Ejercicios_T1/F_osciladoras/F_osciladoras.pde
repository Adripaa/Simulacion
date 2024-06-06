float x1 = 0;
float x2 = 0;
float v = 0.05; // Velocidad de la partícula
boolean function1Active = true;

void setup() {
  size(800, 600);
}

void draw() {
  background(255);
  
  // Calcula las coordenadas y usando las funciones oscilatorias
  float y1 = sin(x1) * exp(-0.002 * x1);
  float y2 = 0.5 * sin(3 * x2) + 0.5 * sin(3.5 * x2);
  
  // Dibuja la primera función oscilatoria
  if (function1Active) {
    textAlign(CENTER, CENTER);
    text("Función 1 activa (Presiona 'F' para cambiar)", width/4, 20);
    text("Función: sin(x1) * exp(-0.002 * x1)", width/4, 40);
    // Dibuja la partícula sobre la primera función
    fill(255, 0, 0);
    ellipse(width/4 + x1, height/2 - y1 * 50, 30, 30);
  }
  
  // Dibuja la segunda función oscilatoria
  else {
    textAlign(CENTER, CENTER);
    text("Función 2 activa (Presiona 'F' para cambiar)", width/4, 20);
    text("Función: 0.5 * sin(3 * x2) + 0.5 * sin(3.5 * x2)", width/4, 40);
    // Dibuja la partícula sobre la segunda función
    fill(255, 0, 0);
    ellipse(width/4 + x2, height/2 - y2 * 50, 30, 30);
  }
  
  // Incrementa la posición de las partículas
  x1 += v;
  x2 += v;
}

// Cambia entre las dos funciones oscilatorias al presionar la tecla 'F'
void keyPressed() {
  if (key == 'f' || key == 'F') {
    function1Active = !function1Active;
    x1 = 0;
    x2 = 0;
  }
}
