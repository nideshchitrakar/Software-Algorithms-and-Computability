/* This class uses the Processing 'Table' class to store and retreive a high score.

   It introduces a "try" statement.  If a table already exists, we use it, if non is return (null pointer)
   then we build one.
   
   The table is in the data folder. (Where it belongs)
   Try deleting it to see what happens.
   Try openning that file outside of Processing.  It is a "comma separated values' file. It will probably open in a spreadsheet.
   */


class HighScoreManager {

  Table table;
  int highScore;
  HighScoreManager() {
    try {
      table = loadTable("data/highscore.csv", "header");
      // we've got one 
      println("We've got one");
      highScore = table.getRow(0).getInt("score");
    } 
    catch (NullPointerException e) {
      println("New table!");
      makeTable();
    }
  }

  void makeTable() {
    table = new Table();
    table.addColumn("score");
    TableRow newRow = table.addRow();
    newRow.setInt("score", 0);
    saveTable(table, "data/highscore.csv");
  }

  void updateHighScore(int newScore) {
    table = loadTable("data/highscore.csv", "header");
    println(table.getRowCount() + " total rows in table"); 
    for (TableRow row : table.rows ()) { 
      int score = row.getInt("score"); 
      println(score);
    }
    int highScore = table.getRow(0).getInt("score");
    println("High score " + highScore);
    if (highScore < newScore) {
      println("New high score");
      table.addRow().setInt("score", highScore);
      table.getRow(0).setInt("score", newScore);
    } else table.addRow().setInt("score", newScore);
    saveTable(table, "data/highscore.csv");
  }
}