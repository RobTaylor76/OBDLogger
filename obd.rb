require './obd_interface.rb'

obd  = OBDInterface.new("COM3")

obd.readmessage
