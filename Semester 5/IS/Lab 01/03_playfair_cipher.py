"""Lab 01 Q3: Playfair cipher using the key GUIDANCE."""


def create_matrix(key):
    letters = []
    for letter in key.upper() + "ABCDEFGHIJKLMNOPQRSTUVWXYZ":
        letter = "I" if letter == "J" else letter
        if letter not in letters:
            letters.append(letter)
    return [letters[i:i + 5] for i in range(0, 25, 5)]


def make_pairs(text):
    text = "".join(letter for letter in text.upper() if letter.isalpha()).replace("J", "I")
    pairs = []
    index = 0
    while index < len(text):
        first = text[index]
        second = text[index + 1] if index + 1 < len(text) else "X"
        if first == second:
            second = "X"
            index += 1
        else:
            index += 2
        pairs.append((first, second))
    return pairs


def encrypt(text, key):
    table = create_matrix(key)
    position = {table[row][column]: (row, column) for row in range(5) for column in range(5)}
    result = ""

    for first, second in make_pairs(text):
        row1, column1 = position[first]
        row2, column2 = position[second]
        if row1 == row2:
            result += table[row1][(column1 + 1) % 5] + table[row2][(column2 + 1) % 5]
        elif column1 == column2:
            result += table[(row1 + 1) % 5][column1] + table[(row2 + 1) % 5][column2]
        else:
            result += table[row1][column2] + table[row2][column1]
    return result


key = "GUIDANCE"
print("Matrix:")
for row in create_matrix(key):
    print(*row)
print("Ciphertext:", encrypt("The key is hidden under the door pad", key))
