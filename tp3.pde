
//https://youtu.be/PJvSy37A3dA
int tamanoCuadrado = 65;


int numcuadra = 6; 
int circulotamb = 15; 
PImage imagen1;


void setup() {
  size(800, 400);
  background(0);
  dibujarCuadricula();
  imagen1 = loadImage("/libraries/imagenfinal.png");
}

void draw() {
  imagenCargada();
}

// Función no retorna un valor mi cuadricula

void dibujarCuadricula() {
  stroke(#9A9A9A); 
  strokeWeight(10); 
  
  for (int i = 0; i <= numcuadra; i++) {
    
    line(0, i * tamanoCuadrado, numcuadra * tamanoCuadrado, i * tamanoCuadrado);
    line(i * tamanoCuadrado, 0, i * tamanoCuadrado, numcuadra * tamanoCuadrado);
  }
  
  for (int i = 0; i <= numcuadra; i++) {
    for (int j = 0; j <= numcuadra; j++) {
      
      fill(255);
      noStroke();
      ellipse(i * tamanoCuadrado, j * tamanoCuadrado, circulotamb, circulotamb);
    }
  }
}

//  retorna un valor
boolean sobreCirculo(float x, float y, float circleX, float circleY, float circulotamb) {
  float d = dist(x, y, circleX, circleY);
  return d < circulotamb / 2;
}



void mousePressed() {
  for (int i = 0; i <= numcuadra; i++) {
    for (int j = 0; j <= numcuadra; j++) {
      float circleX = i * tamanoCuadrado;
      float circleY = j * tamanoCuadrado;
      
      if (sobreCirculo(mouseX, mouseY, circleX, circleY, circulotamb)) {
        background(0);   
        CambiarTamanoCir();  
        dibujarCuadricula();  
      }
    }
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    resetGrid();
  }
}

// cambiar el tamaño de los círculos aleatoriamente
void CambiarTamanoCir() {
  circulotamb = (int) random(10, 30);  
}



//  reiniciar 
void resetGrid() {
  tamanoCuadrado = 65;
  numcuadra = 6;
  circulotamb = 10;
  
  background(0);
  dibujarCuadricula();
  
}


void imagenCargada(){
    push();
    image(imagen1, 400, 0);
    pop();
}
