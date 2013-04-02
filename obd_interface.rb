require 'serialport'

class OBDInterface

  def initialize port, baud = 38400, nbits = 7, stopb = 1
    @sp = SerialPort.new(port, baud, nbits, stopb, SerialPort::NONE)
  end

  def reset
    at_message 'Z'
  end

  def monitor_all
    at_message 'MA'
  end

  def at_message message
    write "AT #{message}"
  end

  def read_message
    @sp.readline
  end

  def disconnect
    @sp.close
  end

  private
  def write(message)
    @sp.write(message)
  end
end
