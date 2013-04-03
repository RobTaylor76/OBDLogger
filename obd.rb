require './obd_interface.rb'
require './message_logger.rb'

obd  = OBDInterface.new("/dev/ttyUSB0", 4800)

logger = MessageLogger.new

puts 'reading...'
obd.connect
msg = obd.read_message
while msg do
  logger.process_message msg
  msg = obd.read_message
end
obd.disconnect
obd.process_messages logger
puts 'done'
