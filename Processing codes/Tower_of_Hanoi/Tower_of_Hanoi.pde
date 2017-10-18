void start() {
  int nDisks = 4;
  TowerOfHanoi th = new TowerOfHanoi(nDisks);
  th.execute();
}

void draw() {
}

class TowerOfHanoi {
  private int n; // number of disks
  
  public TowerOfHanoi(int n) {
    this.n = n;
  }
  
  public void execute() {
    int nDisks = n;
    int limit = (int)Math.pow(2,nDisks)-1; // number of iterations = 2^n - 1
    for (int i = 0; i < limit; i++) {
      int disk = disk(i); // disk to move
      int source = (movement(i,disk)*direction(disk,n))%3; // source tile
      int destination = (source + direction(disk,n))%3; // destination tile
      move(i,disk,source,destination);
    }
  }
  
  private int disk(int i) { // returns the disk to be moved in step i
    int c;
    int x = i + 1;
    for (c = 0; x % 2 == 0; c++) {
      x = x/2;
    }
    return c;
  }
  
  private int movement(int i, int d) { // keep track of how many times disk d has moved before i
    while (d--!=0) {
      i = i/2;
    }
    return (i+1)/2;
  }
  
  private int direction(int d, int n) {
    return 2-(n+d)%2;
  }
  
  private void move(int step, int disk, int source, int destination) {
    println((step+1) + ". Moved disk " + (disk+1) + " from Tower " + (source+1) + " to Tower " + (destination+1));
  }
}