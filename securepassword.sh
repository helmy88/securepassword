#!/usr/bin/env python3
import secrets
import string

# ASCII art text
ascii_art = """
  _____ ______ _____ _    _ _____  ______ _____         _____ _______          ______  _____  _____  
 / ____|  ____/ ____| |  | |  __ \|  ____|  __ \ /\    / ____/ ____\ \        / / __ \|  __ \|  __ \ 
| (___ | |__ | |    | |  | | |__) | |__  | |__) /  \  | (___| (___  \ \  /\  / / |  | | |__) | |  | |
 \___ \|  __|| |    | |  | |  _  /|  __| |  ___/ /\ \  \___ \\___ \  \ \/  \/ /| |  | |  _  /| |  | |
 ____) | |___| |____| |__| | | \ \| |____| |  / ____ \ ____) |___) |  \  /\  / | |__| | | \ \| |__| |
|_____/|______\_____|\____/|_|  \_\______|_| /_/    \_\_____/_____/    \/  \/   \____/|_|  \_\_____/ 
"""

# Display the ASCII art
print(ascii_art)

# Additional text
print("Developed by Perthlis\n")

def generate_password(length, use_uppercase, use_lowercase, use_digits, use_symbols):
    # Combine a fixed secret string to add uniqueness
    secret_string = "YourSecretStringHere"  # Replace with your secret string
    characters = secret_string

    if use_uppercase:
        characters += string.ascii_uppercase
    if use_lowercase:
        characters += string.ascii_lowercase
    if use_digits:
        characters += string.digits
    if use_symbols:
        characters += string.punctuation

    if not characters:
        return "Please select at least one character set."

    # Use the user's chosen options to generate the password
    password = ''.join(secrets.choice(characters) for _ in range(length))
    return password

def get_yes_no_input(prompt):
    while True:
        user_input = input(prompt).lower()
        if user_input == 'y':
            return True
        elif user_input == 'n':
            return False
        else:
            print("Incorrect input. Please enter 'y' for yes or 'n' for no.")

def main():
    print("Welcome to the Password Generator!")
    length = int(input("Enter password length: "))
    use_uppercase = get_yes_no_input("Include uppercase letters? (y/n): ")
    use_lowercase = get_yes_no_input("Include lowercase letters? (y/n): ")
    use_digits = get_yes_no_input("Include digits? (y/n): ")
    use_symbols = get_yes_no_input("Include symbols? (y/n): ")

    password = generate_password(length, use_uppercase, use_lowercase, use_digits, use_symbols)
    print("Generated Password:", password)

if __name__ == "__main__":
    main()
