
float dt = 0.1;
PVector a, b, p, vel, vel2, ace, vel2ace;
boolean c = false;

void setup() {
  size (600, 600);
  
  a = new PVector(width/2 - 0.2*width, height/2);
  b = new PVector(width/2 + 0.2*width, height/2 - 0.2*height);
  p = new PVector(width/2 - 0.2*width, height/2);
  vel = PVector.sub(b,a);
  vel.normalize();
  //println(vel.mag());
  //vel = b.sub(a); //modifica tambien b
  vel.mult(15);
  
  ace = PVector.sub(a,b);
  ace.normalize();
  ace.mult(15);

  
  vel2 = PVector.sub(a,b);
  vel2.normalize();
  vel2.mult(15);            
}

void draw() {
  
  background(255);
  
  //Particula p
  stroke(0,255,0);
  fill(0,255,0);
  ellipse(p.x, p.y, 40 , 40);
  
  //Segmento a-b
  strokeWeight(3);
  stroke(255,0,0);
  fill(255);
  ellipse(a.x, a.y, 15 , 15);
  
  stroke(0,0,255);
  fill(255);
  ellipse(b.x, b.y, 15 , 15);
  
  stroke(0);
  line(a.x,a.y,b.x,b.y);
  
  //p.x += vel.x * dt;
  //p.y += vel.y * dt;
  
  
  
  float d = PVector.dist ( p, b);
  float d2 = PVector.dist ( p, a);
  
  
  if (c==true){
    vel2.add(PVector.mult(ace,dt));
    p.add(PVector.mult(vel2,dt));
    if (d2<15){
      c=false;
    }
    //println("baja");
  }
  else if(c==false){
    vel2 = new PVector (0,0);
    p.add(PVector.mult(vel,dt));
    
    if (d<15){
      c=true;
    }
  }
  
}
