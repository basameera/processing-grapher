import processing.serial.*;

Serial myPort;  // Create object from Serial class
char serialLineEnding = '\n';
boolean serialConnected = false;
char serialParity = 'N';
int serialDatabits = 8;
float serialStopbits = 1.0;
String serialPortName = "/dev/ttyACM0";
int serialBaudRate = 115200;

void serialEvent (Serial myPort) {
  try {
    String inString;
    if (serialLineEnding != 0) {
      inString = myPort.readStringUntil(serialLineEnding);
    } else {
      inString = myPort.readString();
    }

    inString = trim(inString); //remove \n, \r stuff

    println(inString);

  } catch (Exception e) {
    println("Error\nUnable to read data from serial port:\n" + e);
  }
}
