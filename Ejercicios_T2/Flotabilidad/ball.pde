class Ball {
  PVector s; // posicion
  PVector v; // Velocidad
  PVector a; // Aceleración
  PVector f; // Fuerza
  
  float m = 10.0;      // Masa
  float r = 35.0;     // Radio
  float d = 0.0002;  // Color
  float vS;          
  
  float Kd1 = 0.15; 
  float Kd2 = 0.30; 

  Ball(PVector s0) {
    s = s0.get();
    v = new PVector(0, 0);
    a = new PVector(0, 0);
  }

  void run() {
    update();
    display();
  }

  void update() {
    updateForce();
    
    v = PVector.add(PVector.mult(a, SIM_STEP), v);
    s = PVector.add(PVector.mult(v, SIM_STEP), s);
    
    a.set(0.0, 0.0);
  }
  
  // Calculo de las fuerzas
  void updateForce() { 
    PVector fG = PVector.mult(G, m);
    PVector fB = new PVector(0.0, 0.0);
    PVector fR = new PVector(0.0, 0.0);
    
    // Sin sumergirse del todo
    if (s.y > height/2-r && s.y < height/2+r) 
    {
      float h = s.y + r - height/2;
      float a = sqrt(2 * h * r - h * h);
      
      vS = (3 * a * a + h * h) * PI * h/6.0;
      fR = new PVector(0.0, -Kd2 * v.y);
    }
    // Sumergido
    else if (s.y > height/2+r)
    {
      vS = 4.0 * PI * r * r * r / 3.0;
      fR = new PVector(0.0, -Kd2 * v.y);
    }
    
    fR = new PVector(0.0, -d * G.y * vS);
    
    applyForce(fG);
    applyForce(fB);
    applyForce(fR);
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(m);
    a.add(f);
  }

  void display() {
    fill(0);
    ellipse(s.x, s.y, r, r);
  }
}
