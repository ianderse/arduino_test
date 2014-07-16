require 'dino'

board = Dino::Board.new(Dino::TxRx.new)
upper_led = Dino::Components::Led.new(pin: 10, board: board)
lower_led = Dino::Components::Led.new(pin: 11, board: board)

def blink(led)
  led.send(:on)
	sleep 0.1
	led.send(:off)
	sleep 0.1
end

def celebrate(leds)
	5.times do
		blink(leds[0])
		blink(leds[1])
	end
end
# 1. Generate a secret number between 0 and 10

secret = rand(0..10)

# 2. Ask the user to input a guess
# 3. React to their guess using the LEDs
# 4. Repeat until they guess correctly

guess = nil
led_array = [upper_led, lower_led]

while guess != secret
	puts "Please input a guess: "
	guess = gets.chomp.to_i
	diff = guess - secret

	if diff < 0
		diff *= -1
	end

	if diff == 0
		puts "Correct!  The number was #{secret}"
		celebrate(led_array)
	elsif diff < 3
		blink(lower_led)
	else
		blink(upper_led)
		sleep 0.2
		blink(upper_led)
	end
end
