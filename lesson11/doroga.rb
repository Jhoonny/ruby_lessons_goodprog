require_relative 'bridge'

puts "sa mergem"

sleep 1

puts "Opppa un rau"
sleep 1

bridge = Bridge.new

bridge.open unless bridge.is_opened?

sleep 1

puts "mergem mai departe"

puts bridge.is_opened?.to_s

