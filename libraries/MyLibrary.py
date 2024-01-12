import re

from robot.api import logger
from RPA.Desktop.keywords import keyword
from robot.libraries.BuiltIn import BuiltIn
# example of accessing a variable from variables.py



class MyLibrary:
    """Give this library a proper name and document it."""


    @keyword
    def click_print(self):
        locator = "image:resources/print_button.png"
        self.desktop.click(locator)

    
    @keyword
    def extraer_capital(self, texto):
        inicio = texto.find("xima del Articulo:") + 18
        fin = texto.find("Prima del Articulo")
        texto = texto[inicio:fin].strip("\n")
        texto = texto.replace(".","").replace(",",".")

        return int(texto)