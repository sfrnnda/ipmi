PImage imagen;
void setup(){
  size (800,400);
  background(#FFFFFF);
  
}
void draw(){
  imagen= loadImage("Sandiasi.png");
  image(imagen,0,0,400,400);
  
  
  println ("X");
  println(mouseX);
  println ("Y");
  println(mouseY);
  fill(#F58A8A); // rosa claro
  noStroke();
  triangle (553,36,695,293,425,293);
  beginShape();
  vertex(536,45);
  vertex(553,36);
  vertex(553,292);
  vertex(693,292);
  vertex(674,314);
  endShape();
  fill(#278E2E);
  ellipse (541,340,275,100);
  stroke(#278E2E);
  strokeWeight(5);
  line(671,352,707,318);
  noStroke();
  fill (#DEEAB9);//verde claro   
  quad (694,291,708,315,668,352,661,323);
  
  //smooth();
  //stroke(#278E2E);
  //strokeWeight(2);
  ellipse (541,333,275,100);
  
  //noSmooth();
  fill(#FC2E2E); //rojo
  noStroke();
  ellipse (542,317,262,90);
  triangle (538,45,675,317,409,319);
  fill(0);
  ellipse(485,288,20,25);
  ellipse(579,248,20,25);
  ellipse(644,279,10,20);
  ellipse(661,251,10,20);
  ellipse(514,177,20,25);
  ellipse(596,137,10,15);
  
  
  
}
