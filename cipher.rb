# a-z ascii value => 97 - 122
# A-Z ascii value => 65 - 90

def caesar_cypher(message, key)
    ascii_message = message_to_ascii_value(message)
    shift_ascii_message = ascii_message.map do |char|
        case char
        when 65..90
            char = char + key <= 90 ? (char + key) : (char + key - 26)  # Shift down if going farther than "Z" value
            char.chr
        when 97..122
            char = char + key <= 122 ? (char + key) : (char + key - 26)  # Shift down if going farther than "z" value
            char.chr
        else
            char.chr
        end
    end
    coded_message = shift_ascii_message.join('')
    puts coded_message  
end

def message_to_ascii_value(message)
    message.chars.map { |character| character.ord } 
end

def get_message
    puts "Enter the secret message"
    message = gets.chomp 
end

def get_key
    puts "Enter a key"
    key = gets.chomp.to_i
    key %= 26
end

message = get_message
key = get_key
caesar_cypher(message, key)
