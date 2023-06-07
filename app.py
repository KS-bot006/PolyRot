from PySide2.QtWidgets import QApplication
from PySide2.QtQml import QQmlApplicationEngine
import sys
from PySide2.QtCore import QObject, Slot

class brain(QObject):
    def __init__(self):
        QObject.__init__(self)

    

    @Slot(str, str, result=str)
    def cipher(self, message, n):
        try:
            n = int(n)
        except:
            n = 4
        regs = "abcdefghijklmnopqrstuvwxyz"
        msg = list(message)
        ciphered_msg = []
        rot = n % 26
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
        
        return ''.join(ciphered_msg)
    
    @Slot(str, str, result=str)
    def decipher(self, message, n):
        try:
            n = int(n)
        except:
            n = 4
        regs = "abcdefghijklmnopqrstuvwxyz"
        msg = list(message)
        deciphered_msg = []
        rot = n % 26
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
        return ''.join(deciphered_msg)

app = QApplication(sys.argv)
backend = brain()
win = QQmlApplicationEngine()
win.rootContext().setContextProperty("brain", backend)
win.quit.connect(app.quit)
win.load("./src/UI.qml")
sys.exit(app.exec_())