import processing.sound.*;
Target[] targets;
SoundFile theme;
SoundFile shotsfx;
SoundFile endSong;
int milliseconds;
int seconds;
String timer;
int counter = 0;
int finishedSeconds;
boolean [] circleClicked = new boolean[15];
boolean [] circleLocked = new boolean[15];
void setup() {
  size(1280, 700);
  rectMode(CORNER);
  background(0);
  theme = new SoundFile(this, "dooty.wav");
  shotsfx = new SoundFile(this, "shotgun.wav");
  endSong = new SoundFile(this, "endSong1.mp3");
  theme.loop();
  targets = new Target[15];
  for (int i=0; i<circleLocked.length; i++) {
    circleLocked[i] = false;
  }
  for (int i=0; i<targets.length; i++) {
    targets[i] = new Target();
  }
}

void draw() {
  if (counter >= 15) {
    finishedSeconds = seconds;
    timer = "Timer: " + finishedSeconds + " Seconds";
    victoryMessage();
  } else {
    milliseconds = frameCount;
    seconds = milliseconds/60;
    timer = "Time: " + seconds + " Seconds";
  }
  fill(255);
  rectMode(CORNER);
  rect(0, 0, 120, 20);
  fill(0);
  textAlign(CORNER);
  text(timer, 10, 15, 200);
  for (int i=0; i<targets.length; i++) {
    targets[i].draw();
  }
  println(counter);
}


void mouseClicked() {
  //shotsfx.play();
  for (int i=0; i<targets.length; i++) {
    if (((dist(mouseX, mouseY, targets[i].xps, targets[i].yps))<targets[i].diameters) && (circleLocked[i] == false)) {
      circleClicked[i] = true;
      circleLocked[i] = true;
      counter++;
      targets[i].fillCheck(circleClicked[i]);
    }
  }
}

void mousePressed() {
}

void mouseReleased() {
}

void victoryMessage() {
  theme.stop();
  //endSong.play();
  fill(255);
  rectMode(CENTER);
  rect(width/2, height/2, 200, 75);
  textAlign(CENTER);
  fill(0);
  text("ALL TARGETS DESTROYED", width/2, height/2 - 10);
  text(timer, width/2, height/2 + 10);
}
