*** Settings ***
Documentation       Keyword resource.

Variables           variables.py

Library             RPA.Windows
Library             RPA.FTP
Library             OperatingSystem
Library             RPA.Desktop
Library             RPA.PDF



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
    Set Wait Time    5    # Tiempo de espera para que cargue informacion de articulos
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
    Set Wait Time    3    # Tiempo de espera para que cargue la opcion de imprimir
    Send Keys    desktop    i
    Imprimir pdf
    

Imprimir pdf
    Set Wait Time    0.5
    RPA.Desktop.Click    coordinates:20,61    left_click    # Click en el icono de imprimir
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    M    # Seleccion de impresora: Imprimir PDF
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    InformacionArticulo    # Nombre del archivo
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Left}
    Send Keys    desktop    keys={Enter}


Extraer capital de pdf
    Open Pdf    InformacionArticulo.pdf
