ArrayList<Car> cars = new ArrayList();

float goalX, goalY;

int timeStep = 200;

Car gbCar = new Car( -1, "0" );
float gbScore;

String[] str_a;
String[] str_b;
float[] scores;
final int gen_size = 5;
int cur_sub;
int countGen = 0;

void setup() {
  size(800, 800);
  background(255);
  gbScore = dist(0, 0, width, height);
  goalX = random(width);
  goalY = random(height);
  smooth();
  ellipseMode(CENTER);
  str_a = new String[gen_size];
  str_b = new String[gen_size];
  scores = new float[gen_size];
  for ( int j = 0; j < gen_size; j++ ) {
    str_a[j] = starterString();
    scores[j] = 0;
  }
  cur_sub = -1;
  countDoneCars = 0;
  for ( int i=0; i < gen_size; i++ ) cars.add( new Car( i, str_a[i] ) );
}

String starterString() {
  String mut = "" + char( '0' + int( random(4) ) );
  return( mut );
 
}

int countDoneCars;

String hr( String cr ) {
  String r = "";
  for ( int t = 0; t < cr.length(); t++) {
    if ( cr.charAt(t) == '0' ) r+= 'N';
    if ( cr.charAt(t) == '1' ) r+= 'L';
    if ( cr.charAt(t) == '2' ) r+= 'R';
    if ( cr.charAt(t) == '3' ) r+= 'A';
  }
  return( r );
}

void draw() {
// background(0);
  fill(255);
  rect(0,0,100,100);
  fill(255,0,0);
  String extra = "";
  text("Best ever: (" + hr(gbCar.genome) + ") = " + int(gbScore) + extra, 10, 20 );
  fill(255,255,0);
  text("Generation " + countGen , 10, 34 );
  for( int tt=0; tt< gen_size; tt++){
    fill(cars.get(tt).k);
    text( "(" + hr( cars.get(tt).genome ) + ")", 10, 48 + 14 * tt);
  }
  if ( countDoneCars == gen_size ) {
    while ( cars.size () > 0 ) cars.remove(0); 
    countDoneCars = 0; 
    arrayCopy( str_a, str_b );
    int bestIndex = 0;
    int worstIndex = 0;
    for ( int j = 0; j < gen_size; j++ ) {
      if ( scores[bestIndex] > scores[j] ) {
        bestIndex = j;
      }
      if ( scores[worstIndex] < scores[j] ) {
        worstIndex = j;
      }
    }  
    str_b[worstIndex] = str_b[bestIndex];
    for ( int j = 0; j < gen_size; j++ ) {
      str_a[j] = scramble( j, str_b[int(random(gen_size))], str_b[int(random(gen_size))] );
    }
    for ( int j = 0; j < gen_size; j++ ) {
      cars.add( new Car( j, str_a[j] ) );
    }
    countGen++;
  }
  gbCar.render();
  for ( int i=0; i < cars.size(); i++ ) cars.get(i).go();
  stroke(255);
  fill(255,0,0);
  ellipse(goalX, goalY, 10, 10);
}

String scramble( int which, String a, String b ) {
  String r;
  int pos = int(random(min(a.length(), b.length())));
  r = a.substring(0, pos) + b.substring(pos, b.length());

 
  if ( random(1) < .5 ) {
    pos = int(random(r.length()));
    if ( random(1) < .5 ) { 
      String mut = "" + char( '0' + int( random(4) ) );
      r = r.substring(0, pos) + mut + r.substring(pos, r.length());
    } 
    else {
      if ( r.length() > 0 ) {
        pos = int(random(r.length()-1));
        r = r.substring(0, pos) + r.substring(pos+1, r.length());
      }
    }
  }
  return( r );
}


void mousePressed() {
  goalX = random(width);
  goalY = random(height);
  gbScore = dist(0, 0, width, height);
  countGen=0;

}

class Car {
  float x, y, z, v;
  color k;
  boolean a, b, c;
  int ins; 
  int time; 
  int[] instructions;
  boolean disable;
  int myNumber;
  String genome;
  Car( int oo, String input ) {
    x=20; 
    y=height/2;
    if ( oo == -1 ) { 
      x = -20; 
      y = -20;
    }
    z=0;
    v=0;
    k=color(0, random(128, 255), random(128, 255));
    a=b=c=false;
    myNumber = oo;
    ins = 0;
    parseString( input );
    time = millis() + timeStep;
    disable = false;
    genome = input;
  }
  void parseString( String in ) {
    instructions = new int[in.length()];
    for ( int j = 0; j < in.length(); j++ ) {
      instructions[j] = int( in.charAt(j) - '0' );
    }
  }
  void report() {
    scores[myNumber] = dist( x, y, goalX, goalY ) + genome.length(); 
    if ( scores[myNumber] < gbScore ) {
      gbScore = scores[myNumber];
      gbCar.x = x;
      gbCar.y = y;
      gbCar.z = z;
      gbCar.k = k;
      gbCar.genome = genome;
    }
    countDoneCars++;
   
  }
  void go() {   
    if ( millis() > time && !disable) {
      time = millis() + timeStep;
      if ( ins < instructions.length ) {
        int i = instructions[ins++];
        switch( i ) {
        case 0:
          break;
        case 1:
          a = !a;
          break;
        case 2:
          b = !b;
          break;
        case 3:
          c = !c;
          break;
        default:
          break;
        }
      } 
      else { 
        a=b=c=false;
        v=0;
        disable = true;
        report();
      }
    }
    z+=(a?-.1:0)+(b?.1:0);
    v+=(c?.1:0);
    x=x+v*cos(z);
    y=y+v*sin(z);
    v*=.99;
    render();
  }
  void render() {
    pushMatrix();
    translate(x, y);
    rotate(z);
    noStroke();
    fill(k); 
    if ( myNumber==-1) fill(255, 0, 0);
    rect(-10, -10, 20, 20);
    stroke(0);
    noFill();
    triangle(-8, -8, 7, 0, -8, 8);
    popMatrix();
  }
}
