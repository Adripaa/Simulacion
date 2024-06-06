float xCar; // Posición en x del coche
float v;    // Velocidad del coche
float energiaCinetica;   // Energía cinética del coche
float k = 0.1; // Coeficiente de rozamiento
float masa = 1;   // Masa del coche
float dt = 0.1; // Intervalo de tiempo
boolean motorEncendido = false; // Variable para controlar si el motor está encendido o no

void setup() {
  size(800, 400);
  xCar = 0; // Iniciar el coche en la posición inicial
  v = 0;    // Iniciar la velocidad en cero
  energiaCinetica = 0;   // Iniciar la energía cinética en cero
}

void draw() {
  background(255);
  updateVelocity();
  drawCar();
  drawInstructions();
}

void drawInstructions() {
  fill(0);
  textAlign(CENTER);
  textSize(16);
  String instructionText = "Presiona 'P' para encender/apagar el motor";
  text(instructionText, width/2, 20);
}

void keyPressed() {
  if (key == 'p' || key == 'P') {
    motorEncendido = !motorEncendido; // Cambiar el estado del motor al presionar la tecla 'p' o 'P'
  }
}

void updateVelocity() {
  // Calcular potencia del motor
  float potencia = motorEncendido ? 1000 : 0; // Si motorEncendido es true, aplicar potencia
  
  // Calcular pérdida de energía por rozamiento
  float resistencia = -k * v * v;
  potencia += resistencia * v;
  
  // Calcular cambio de energía cinética
  float cambioEnergiaCinetica = potencia * dt;
  
  // Actualizar velocidad y energía cinética
  energiaCinetica += cambioEnergiaCinetica;
  
  v = sqrt((2 * energiaCinetica) / masa);
  
  // Actualizar la posición del coche
  xCar += v * dt;
  
  // Si el coche se sale de la pantalla por completo, vuelve a empezar desde la parte izquierda
  if (xCar > width  + 50) {
    xCar = -50; // Establecer la posición del coche en la parte izquierda de la pantalla
    energiaCinetica = 0;     // energiaCinetica = 0
    v = 0;      // v = 0
  }
}


void drawCar() {
  // Conductor
  fill(252, 208, 180);
  rect(xCar + 10, height - 70, 30, 40);
  
  // Cuerpo del coche
  fill(255, 0, 0);
  rect(xCar + 5, height - 50, 60, 30);
  
  // Ruedas
  fill(0);
  ellipse(xCar + 20, height - 10, 20, 20);
  ellipse(xCar + 55, height - 10, 20, 20);
}
