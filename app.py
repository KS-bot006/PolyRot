from PySide2.QtWidgets import QApplication
from PySide2.QtQml import QQmlApplicationEngine
import sys


app = QApplication(sys.argv)
win = QQmlApplicationEngine()
win.quit.connect(app.quit)
win.load("./src/UI.qml")
sys.exit(app.exec_())