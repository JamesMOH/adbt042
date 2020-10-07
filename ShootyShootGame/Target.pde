class Target {
  float xps;
  float yps;
  float shapes;
  float diameters;
  boolean fill;
  boolean lockCheck;
  PImage doot;
  PImage explosion;
  Target() {
    xps = random(width);
    yps = random(height);
    diameters = random(30, 60);
    doot = loadImage("doot.png");
    explosion = loadImage("Explosion.png");
  }


  void draw() {
    if (fill) {
      fill(255, 0, 0);
      ellipse(xps, yps, diameters, diameters);
      imageMode(CENTER);
      image(explosion, xps, yps, diameters, diameters);
    } else {
      fill(255);
      imageMode(CENTER);
      ellipse(xps, yps, diameters, diameters);
      image(doot, xps, yps, diameters, diameters);
    }
  }


  void fillCheck(boolean circleClicked) {
    for (int i=0; i<targets.length; i++) {
      if (circleClicked) {
        fill = true;
      }
    }
  }
}
