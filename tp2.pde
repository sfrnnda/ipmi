PImage[] imagenes;
String[] textos;
int indicePantalla = 0;
int tiempoUltimoCambio;
int duracionPantalla = 8000; 
boolean mostrarBotonInicio = true;
boolean mostrarBotonReinicio = false;
PFont fuente;

void setup() {
  size(640, 480);
  imagenes = new PImage[5]; 
  textos = new String[5]; 
  
  imagenes[0] = loadImage("imagen1.jpg");
  imagenes[1] = loadImage("imagen2.jpg");
  imagenes[2] = loadImage("imagen3.jpg");
  imagenes[3] = loadImage("imagen4.jpg"); 
  imagenes[4] = loadImage("imagen5.jpg"); 
  
  textos[0] = "Había una vez, en una granja, \n una mamá pata que estaba muy feliz \n porque sus huevos estaban a punto de romperse. \n Uno a uno, los pequeños patitos empezaron a salir, \n todos muy bonitos y amarillos. \n Pero el último huevo, el más grande de todos, \n tardó más en abrirse.\n Cuando finalmente se rompió,\n salió un patito diferente: \n era grande, gris y torpe.";
  textos[1] = "Desde el primer momento, \n los otros animales del corral se burlaron de él. \n ¡Qué feo eres!, le decían. \n Incluso sus propios hermanos lo despreciaban. \n Triste y sintiéndose solo, el patito decidió huir de la granja \n en busca de un lugar donde encajar.";
  textos[2] = "El patito vagó por el campo y los bosques, \n enfrentando muchos peligros y dificultades.\n El invierno llegó, y fue una época especialmente \n dura para él.  Sin embargo, el patito \n sobrevivió y, cuando la primavera volvió,\n encontró un grupo de hermosos cisnes \n nadando en un lago. Atraído por su elegancia,\n se acercó con timidez, \n temiendo ser rechazado una vez más.";
  textos[3] = "Para su sorpresa, los cisnes \n lo recibieron con amabilidad. Cuando se \n miró en el agua, vio su reflejo y se dio cuenta \n de que ya no era un patito feo. \n Durante el invierno, había crecido y se había \n transformado en un magnífico cisne.\n Ahora entendía por qué siempre había \n sido diferente: no era un pato, \n sino un cisne desde el principio."; 
  textos[4] = "Finalmente, el patito encontró \n su lugar en el mundo, rodeado de otros como él.\n Y así, vivió felizmente, aceptado y apreciado \n por su verdadera belleza. \n Y colorín colorado, este cuento se ha acabado"; 
  
  fuente = createFont("Arial", 22);
  textFont(fuente);
  
  tiempoUltimoCambio = millis();
}

void draw() {
  background(0);
  
  if (mostrarBotonInicio) {
    fill(255);
    textAlign(CENTER, CENTER);
    text("PATITO FEO", width/2, height/4); 
    rect(width/2 - 50, height/2 - 25, 100, 50);
    fill(0);
    text("Iniciar", width/2, height/2);
    
    if (mousePressed && mouseX > width/2 - 50 && mouseX < width/2 + 50 && mouseY > height/2 - 25 && mouseY < height/2 + 25) {
      mostrarBotonInicio = false;
      tiempoUltimoCambio = millis();
    }
  } else {
    image(imagenes[indicePantalla], 0, 0, width, height);
    
    fill(255);
    float desplazamiento = sin(millis() * 0.005) * 20;
    textAlign(LEFT, BASELINE);
    text(textos[indicePantalla], 50 + desplazamiento, 100);
    
    if (millis() - tiempoUltimoCambio > duracionPantalla) {
      indicePantalla = (indicePantalla + 1) % imagenes.length;
      tiempoUltimoCambio = millis();
    }
    
    if (indicePantalla == imagenes.length - 1 && millis() - tiempoUltimoCambio > duracionPantalla) {
      mostrarBotonReinicio = true;
    }
    
    if (mostrarBotonReinicio) {
      fill(255);
      rect(width/2 - 50, height - 75, 100, 50);
      fill(0);
      textAlign(CENTER, CENTER);
      text("Reiniciar", width/2, height - 50);
      
      if (mousePressed && mouseX > width/2 - 50 && mouseX < width/2 + 50 && mouseY > height - 75 && mouseY < height - 25) {
        indicePantalla = 0;
        tiempoUltimoCambio = millis();
        mostrarBotonReinicio = false;
      }
    }
  }
}
