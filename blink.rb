require 'dino'

board = Dino::Board.new(Dino::TxRx.new)
led = Dino::Components::Led.new(pin: 11, board: board)
led2 = Dino::Components::Led.new(pin: 10, board: board)

[:on, :off].cycle do |switch|
  led.send(switch)
  sleep 0.5
  led2.send(switch)
  puts switch
end
