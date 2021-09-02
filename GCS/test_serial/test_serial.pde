/**
 * Serial Read
 */

void setup() 
{
  size(200, 200);
  
  myPort = new Serial(this, serialPortName, serialBaudRate, serialParity, serialDatabits, serialStopbits);
  myPort.bufferUntil(serialLineEnding);
}

void draw()
{

}
