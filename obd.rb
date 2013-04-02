require './obd_interface.rb'

obd  = OBDInterface.new("COM3")

obd.connect
obd.read_message
obd.diconnect
