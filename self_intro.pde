
DottedNumber dNum;
DottedWord dWord;

void setup() {
  size(600,600);
  colorMode(HSB,360,100,100);
  background(0);
  smooth();
  dNum = new DottedNumber(6);
  dWord = new DottedWord(4);
}
 
void draw() {
  background(0);
  //
  String y = str(year());
  String mo = str(month());
  String d = str(day());
  String h = str(hour());
  String m = str(minute());
  String s = str(second());
  makeDigitNum(y,  x-100,        20);
  makeDigitNum(mo, x-offset1,   120);
  makeDigitNum(d,  x,           120);
  makeDigitNum(h,  x-offset1*2, 220);
  makeDigitNum(m,  x-offset1,   220);
  makeDigitNum(s,  x,           220);
  
  makeDigitLetter("kuni", x, 320);
  
}
 
int x = 300;
int offset1 = 120;
int offset2 = 50;
int constX = 7;
int constY = 4;
 
void makeDigitNum(String ts, int xpos, int ypos) {
  for (int i=0; i<ts.length(); i++) {
    if (ts.length() == 1) {
      dNum.makeNumber(0, xpos, ypos);
      dNum.makeNumber(int(str(ts.charAt(i))), xpos+offset2, ypos);
    }
    else {
      dNum.makeNumber(int(str(ts.charAt(i))), xpos+offset2*i, ypos);
    }
  }
}              

void makeDigitLetter(String txt, int xpos, int ypos){
  for(int i=0; i<txt.length(); i++){
    dWord.makeLetter(txt.charAt(i), xpos+offset2*i, ypos);
  }
}

class DottedWord {
  float x, y;
  float ew, eh, diameter;
  float offset;
  DottedWord(float diameter) {
    this.x = 0;
    this.y = 0;
    this.diameter = diameter;
    this.ew = diameter;
    this.eh = diameter;
    this.offset = 10;
  }
  
  void makeLetter(char w, float px, float py){
      if('a'<=w && w<='z'){
        //char to int
        int letNum = 0;
        if(w=='k')  letNum=0;
        if(w=='u')  letNum=1;
        if(w=='n')  letNum=2;
        if(w=='i')  letNum=3;
        
        displayDots(letNum, px, py);
      }
      else{
        println("ERROR");
        //exception
      }
      
  }
  
  void displayDots(int pnum, float px, float py) {
    noStroke();
    fill(122,99,99);
    for (int i=0; i<7; i++) {
      for (int t=0; t<4; t++) {
        if (myname[pnum][i*4 + t] == 1) {
          ellipse (px + offset*t, py + offset*i, ew, eh);
        }
        else {
          ellipse (px + offset*t, py + offset*i, ew/4, eh/4);
        }
      }
    }
  }
  
}

 
class DottedNumber {
  float x, y;
  float ew, eh, diameter;
  float offset;
 
  //
  DottedNumber(float diameter) {
    this.x = 0;
    this.y = 0;
    this.diameter = diameter;
    this.ew = diameter;
    this.eh = diameter;
    this.offset = 10;
  }
 
  //
  void makeNumber(int value, float px, float py) {
    if (value >= 0 && value <=9) {
      displayDots(value, px, py);
    }
    else {
      displayDots(10, px, py);
    }
  }
  //
  void displayDots(int pnum, float px, float py) {
    noStroke();
    fill(122,99,99);
    for (int i=0; i<constX; i++) {
      for (int t=0; t<constY; t++) {
        if (numbers[pnum][i*constY + t] == 1) {
          ellipse (px + offset*t, py + offset*i, ew, eh);
        }
        else {
          ellipse (px + offset*t, py + offset*i, ew/4, eh/4);
        }
      }
    }
  }
}
/*
int[] aa = {
  0,0,0,0,
  1,1,1,1,
  1,0,0,1,
  1,1,1,1,
  1,0,0,1,
  1,0,0,1,
  0,0,0,0
};

int[] bb = {
  0,0,0,0,
  1,1,1,0,
  1,0,0,1,
  1,1,1,1,
  1,0,0,1,
  1,1,1,1,
  0,0,0,0
};
*/
  
int[] kk = {
  0,0,0,0,
  1,0,0,1,
  1,0,1,0,
  1,1,0,0,
  1,0,1,0,
  1,0,0,1,
  0,0,0,0
};
 
int[] uu = {
  0,0,0,0,
  1,0,0,1,
  1,0,0,1,
  1,0,0,1,
  1,0,0,1,
  1,1,1,1,
  0,0,0,0
};

int[] nn = {
  0,0,0,0,
  1,0,0,1,
  1,1,0,1,
  1,0,1,1,
  1,0,0,1,
  1,0,0,1,
  0,0,0,0
};
 
int[] ii = {
  0,0,0,0,
  1,1,1,1,
  0,1,1,0,
  0,1,1,0,
  0,1,1,0,
  1,1,1,1,
  0,0,0,0
};
 
int[] n0 = {
  1,1,1,1,
  1,0,0,1,
  1,0,0,1,
  1,0,0,1,
  1,0,0,1,
  1,0,0,1,
  1,1,1,1
};
int[] n1 = {
  0,0,0,1,
  0,0,0,1,
  0,0,0,1,
  0,0,0,1,
  0,0,0,1,
  0,0,0,1,
  0,0,0,1
};
int[] n2 = {
  1,1,1,1,
  0,0,0,1,
  0,0,0,1,
  1,1,1,1,
  1,0,0,0,
  1,0,0,0,
  1,1,1,1
};
int[] n3 = {
  1,1,1,1,
  0,0,0,1,
  0,0,0,1,
  1,1,1,1,
  0,0,0,1,
  0,0,0,1,
  1,1,1,1
};
int[] n4 = {
  1,0,0,1,
  1,0,0,1,
  1,0,0,1,
  1,1,1,1,
  0,0,0,1,
  0,0,0,1,
  0,0,0,1
};
int[] n5 = {
  1,1,1,1,
  1,0,0,0,
  1,0,0,0,
  1,1,1,1,
  0,0,0,1,
  0,0,0,1,
  1,1,1,1
};
int[] n6 = {
  1,1,1,1,
  1,0,0,0,
  1,0,0,0,
  1,1,1,1,
  1,0,0,1,
  1,0,0,1,
  1,1,1,1
};
int[] n7 = {
  1,1,1,1,
  0,0,0,1,
  0,0,0,1,
  0,0,0,1,
  0,0,0,1,
  0,0,0,1,
  0,0,0,1
};
int[] n8 = {
  1,1,1,1,
  1,0,0,1,
  1,0,0,1,
  1,1,1,1,
  1,0,0,1,
  1,0,0,1,
  1,1,1,1
};
int[] n9 = {
  1,1,1,1,
  1,0,0,1,
  1,0,0,1,
  1,1,1,1,
  0,0,0,1,
  0,0,0,1,
  1,1,1,1
};
int[] nOff = {
  0,0,0,0,
  0,0,0,0,
  0,0,0,0,
  0,0,0,0,
  0,0,0,0,
  0,0,0,0,
  0,0,0,0
};
 
int[][] numbers = {n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, nOff};
int[][] myname = {kk, uu, nn, ii};
