# A caesar cipher is an encryption technique that shifts the letters of a word
# a certain amount of characters foward, called it's shift factor.

# Every string character in Ruby is represented by an ASCII value.


def caesar_cipher (string, shift_factor)
  # A has an ascii value of 65, and Z's value is 90.
  min_ascii_value = 97
  max_ascii_value = 122
  # Create an array to store the encrypted string
  encrypted_string = []

  # Convert the string argument into an array
  string_array = string.split('') # Splits each character apart

  # Iterate over each character within the new array
  string_array.each do |character|
    # Create a variable to hold the character's ASCII value
    character_ascii = character.ord
    # IF the current character's value represents an empty space, push it to the end of the encrypted string array
    if character_ascii == 32
      encrypted_string.push(character)
    else
      # Increment the character's ASCII value by the shift_factor's amount
      character_ascii += shift_factor
      # IF the new ASCII value ends up exceeding 122 (Z's value)...
      if character_ascii > 122
        # Find the difference between the new ASCII and the MAX ASCII
        ascii_difference = character_ascii - max_ascii_value
        # Take the difference and subtract it from the shift factor
        new_shift_factor = shift_factor - ascii_difference
        # THEN take that difference, add it too the MIN ASCII, and set this as the new ASCII value the new character
        character_ascii = min_ascii_value + new_shift_factor
      end
      # Convert the ASCII value back into a string and push it to the end of the array that will store the encrypted string
      encrypted_string.push(character_ascii.chr)
    end
  end 
  # Convert the array back into a string and return it
  return encrypted_string.join
end

print caesar_cipher("hello world", 3)



