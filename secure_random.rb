require 'securerandom'

a = SecureRandom.hex(6)
b = SecureRandom.base64(8)
c = SecureRandom.urlsafe_base64(12)

puts a
puts b
puts c