import ketai.sensors.*; 
import android.content.Context;
import android.os.Environment;
Context context;
int day, month, year,hour,minute, second;
double longitude, latitude, altitude;
float  lat,lon;
KetaiLocation location;
Table table;

void setup() {
 
  fullScreen();
  day= day();
  month=month();
  table=new Table();
  table.addColumn("day");
  table.addColumn("month");
  table.addColumn("hour");
  table.addColumn("minute");
  table.addColumn("second");
  table.addColumn("longitude");
  table.addColumn("latitude");
    //location = new KetaiLocation(this);
  textSize(20);
  

}

void draw() {
  background(0);
  hour= hour();
  minute=minute();
  second=second();
  
  if (location.getProvider()=="none"){
    text("Data unavailable",70,90);
    TableRow newRow = table.addRow();
  newRow. setInt ("day", day);
  newRow. setInt ("month", month);
  newRow. setInt ("hour", hour);
  newRow. setInt ("minute", minute);
  newRow. setInt ("second", second);
  newRow. setString ("longitude", "N/A");
  newRow. setString ("latitude", "N/A");  
  }
   
   String str= Environment.getExternalStorageDirectory().getAbsolutePath();
  saveTable(table, str+"/new.csv");
  text("Program running!",70,70);
 
  
}
  void onResume(){
  location=new KetaiLocation(this);
  //location.setUpdateRate (10000,10);
  super.onResume();
}

void onLocationEvent(double _latitude, double _longitude, double _altitude)
{
 lon = (float) longitude;
  lat = (float) latitude;
  
  TableRow newRow = table.addRow();
  newRow. setInt ("day", day);
  newRow. setInt ("month", month);
  newRow. setInt ("hour", hour);
  newRow. setInt ("minute", minute);
  newRow. setInt ("second", second);
  newRow. setFloat ("longitude", lon);
  newRow. setFloat ("latitude", lat);
  
  longitude = _longitude;
  latitude = _latitude;
  altitude = _altitude;
       
}
