PREP
====

Procesamiento de datos sobre la elección del 2012 en México.

Casillas con exceso de votos (más votos que votantes) por estado, los colores
son por el estado que ganó, en cada estado.

![hist](https://github.com/downloads/ElDeveloper/PREP/hist.png)

Porcentaje de participantes por casillas, por estado. Es muy curioso notar, que 
una distribución de este tipo debería ir sólo de 0 a 1, pero hay lugares en 
donde hasta 300% de participación se logró.

![part](https://github.com/downloads/ElDeveloper/PREP/participacion.jpg)

USO
===

Ejecuta `script.sh` para descargar los datos del IFE y generar los archivos 
necesarios.

En MATLAB ejecuta `hist_por_estado` o `part_por_estado` para generar las 
gráficas.