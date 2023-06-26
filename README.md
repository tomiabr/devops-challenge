# Deploy app - prueba 1

Para el despliegue de nuestra app, automatizamos los diferentes procesos, lo que permite que podamos realizar despliegues consistentes en forma eficiente y reproducible.

Para la puesta a punto de todo el ambiente necesario,(herramientas, dependencias y código fuente) utilizaremos el script init_script.sh al que podremos descargar con los siguientes pasos directamente desde nuestra consola.
Los procesos estan orientados para utilizar en una distribución GNU/Debian (Linux) tanto para entorno local o recurso cloud.

## Local 

Debemos navegar hacia la consola y ejecutar los siguientes comandos, para descargar, otorgar privilegios y ejecutar dicho script

```
wget https://raw.githubusercontent.com/tomiabr/devops-challenge/main/app/scripts/init_script.sh
chmod +x init_script.sh
./init_script.sh
```

Una vez finalizado, nuestra app estará disponible. 
Podremos acceder a la app para solicitar prestamo desde http://localhost:8000/ y para visualizar el estado de los mismos desde http://localhost:3000/ con credenciales user: admin pass: Devops2023**

## Cloud
Para el despliegue de nuestra app en un recurso cloud, podremos utilizar el servicio EC2 de AWS. Creando una instancia que alojará la misma.

Desde la consola de EC2 vamos a lanzar una nueva instancia

![image](https://github.com/tomiabr/devops-challenge/assets/134442444/c35c8b23-4c7f-46d6-a1da-217ca7dae53c)

Utilizaremos como OS Ubuntu 20

![image](https://github.com/tomiabr/devops-challenge/assets/134442444/947e2f1a-833d-4fbc-af41-73ad101ff78e)

Debemos crear un nuevo security group para que podemos acceder remotamente a nuestro nodo, con 3 reglas:
Puerto 22, para nuestra IP - Para acceder por SSH
Puerto 8000, para todos - Solicitud prestamo
Puesrto 3000, para todos - Dashboard solicitudes

![image](https://github.com/tomiabr/devops-challenge/assets/134442444/b02e0ea2-ed8c-47f3-a131-b09c5a72aefc)

Vamos a utilizar la función disponible para cargar datos de usuario, que ejecutará una vez inicializado el nodo

![image](https://github.com/tomiabr/devops-challenge/assets/134442444/e088d5b9-2b55-47e6-bf0e-3700dc51d6a4)

Utilizaremos los siguientes comandos

```
#!/bin/bash
wget https://raw.githubusercontent.com/tomiabr/devops-challenge/main/app/scripts/init_script.sh
chmod +x init_script.sh
./init_script.sh
```
