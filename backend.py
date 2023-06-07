
def cipher(message, n):
    regs = "abcdefghijklmnopqrstuvwxyz"
    msg = list(message)
    ciphered_msg = []

    if n >= 26:
        rot = n % 26
    else:
        rot = n

    for letter in msg:
        if letter in regs:
            pos = regs.index(letter)
            for i in range(rot):
                pos += 1
                if pos == 26:
                    pos = 0
            ciphered_msg.append(regs[pos])

        elif letter in regs.upper():
            pos = regs.upper().index(letter)
            for i in range(rot):
                pos += 1
                if pos == 26:
                    pos =0
            ciphered_msg.append(regs.upper()[pos])

        else:
            ciphered_msg.append(letter)

    print(''.join(ciphered_msg))


def decipher(message, n):
    regs = "abcdefghijklmnopqrstuvwxyz"
    msg = list(message)
    deciphered_msg = []

    if n >= 26:
        rot = n % 26
    else:
        rot = n

    for letter in msg:
        if letter in regs:
            pos = regs.index(letter)
            pos -= rot
            deciphered_msg.append(regs[pos])

        elif letter in regs.upper():
            pos = regs.upper().index(letter)
            pos -= rot
            deciphered_msg.append(regs.upper()[pos])

        else:
            deciphered_msg.append(letter)

    print(''.join(deciphered_msg))

decipher(input("Enter msg: "), int(input("ROT: ")))
    
