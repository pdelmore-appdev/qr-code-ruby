require "rqrcode"


def qr_method
puts "What kind of QR code would you like to generate? (type '1', '2' or '3')"
puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"

choice = gets.chomp

if choice == "1"
  puts "What is the URL you would like to enode?"

  url = gets.chomp
  qrcode = RQRCode::QRCode.new(url)

elsif choice == "2"
  puts "What is the name of the wifi network?"
  network = gets.chomp
  puts "What is the password?"
  password = gets.chomp

  qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:#{network};P:#{password};;")

elsif choice == "3"
  puts  "What is the phone number you want the code to send a text message to?"
  number = gets.chomp
  puts "What do you want to populate the message with?"
  message = gets.chomp
  qrcode = RQRCode::QRCode.new("SMSTO:#{number}:#{message}")

else 
  puts "I didn't understand that. Make sure you type 1, 2 or 3."
end

 
puts "What would you like to call the PNG?"
png_name = gets.chomp

png = qrcode.as_png({ :size => 500 })
IO.binwrite("#{png_name}.png", png.to_s)

end


qr_method()
