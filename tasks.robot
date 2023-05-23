*** Settings ***
Documentation       Robot de consulta de poliza para extraer capital asegurado

Variables           variables.py
Resource            keywords.robot

Library             RPA.Windows
Library             RPA.FTP


*** Tasks ***
Leer capital asegurado
    Consultar poliza    ${seccion}    ${poliza}    ${endoso}    ${articulo}      
     

