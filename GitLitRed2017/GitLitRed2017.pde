//0: menu
//1: tutorial
int storyStage;
Main main;
Dialogue dialogue;
Grid grid;

void setup(){
  size(600,600);
  main = new Main();
  String[] d = {"The quick brown fox jumped over the lazy dog.", "Why did he jump?", "Who knows"};
  //dialogue = new Dialogue(d);
}

void draw(){
  if(storyStage != 0){
     main.go(storyStage);
     main.display();
  }
  background(255);
  main.display();
  if(dialogue != null){
    dialogue.display();
  }
}
void mouseReleased(){
  if(dialogue != null){
    dialogue.updateCtr();
  }
}
void keyPressed(){
    if (key == CODED) {
      if (keyCode == UP) {
        main.player.walk(0);
      }
      if (keyCode == DOWN) {
        main.player.walk(1);
      }
      if (keyCode == RIGHT) {
        main.player.walk(2);
      }
      if (keyCode == LEFT) {
        main.player.walk(3);
      }
    }
    if(main.scarlett.isInRange(main.player) && (key == 'f' || key == 'F') ){
      main.player.setDialogue(true);
      String[] d = main.scarlett.interact();
      dialogue = new Dialogue(d);
    }
}