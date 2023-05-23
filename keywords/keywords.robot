*** Settings ***
Documentation       Template keyword resource.

Variables           variables.py

Library             RPA.Windows
Library             RPA.FTP
Library             OperatingSystem
Library             RPA.Desktop



*** Keywords ***
Consultar poliza
    [Arguments]     ${seccion}    ${poliza}    ${endoso}    ${articulo}
    Abrir menu consulta de poliza
    Ingresar numero de poliza    ${seccion}    ${poliza}    ${endoso}
    Consultar articulo    ${articulo}


Abrir menu consulta de poliza
    Set Wait Time    0.2
    Send Keys    desktop    keys={Ctrl}{M}
    Send Keys    desktop    polizas
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Down}
    Send Keys    desktop    keys={Down}
    Send Keys    desktop    keys={Down}
    Send Keys    desktop    keys={Enter}
    
Ingresar numero de poliza
    [Arguments]     ${seccion}    ${poliza}    ${endoso}
    Send Keys    desktop    ${seccion}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    ${poliza}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    ${endoso}
    Send Keys    desktop    keys={Enter}
    Set Wait Time    5
    Send Keys    desktop    keys={Enter}
    

Consultar articulo
    [Arguments]     ${articulo}
    Set Wait Time    0.3
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Right}
    Send Keys    desktop    keys={Right}
    Send Keys    desktop    keys={Right}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    ${articulo}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Enter}
    Set Wait Time    3
    Send Keys    desktop    i
    Imprimir pdf
    

Imprimir pdf
    Set Wait Time    0.5
    RPA.Desktop.Click    coordinates:20,61    left_click
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    M
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    InformacionArticulo
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Left}
    Send Keys    desktop    keys={Enter}


