README.txt
===========

SERVICIO: SSH
-------------

1. DESCRIPCIÓN
--------------
Este servicio proporciona un script para configurar un servidor Linux
y permitir la conexión remota mediante SSH desde una máquina cliente.

El script permite:
- Configurar una IP fija en la red interna
- Instalar y activar el servicio SSH
- Cambiar el puerto SSH al 356
- Comprobar el estado del servicio

--------------------------------------------------

2. REQUISITOS
-------------
- Sistema operativo: Ubuntu
- Usuario con permisos sudo
- Dos máquinas:
  * Servidor
  * Cliente

--------------------------------------------------

3. CONFIGURACIÓN DE RED
----------------------

3.1 Máquina SERVIDOR
-------------------
La máquina servidor debe tener dos adaptadores de red:

- Adaptador 1: NAT
- Adaptador 2: Red interna

La interfaz de red interna será `enp0s8`.

--------------------------------------------------

3.2 Máquina CLIENTE
------------------
La máquina cliente debe estar configurada en la MISMA red interna
que el servidor.

Configuración recomendada:
- Adaptador de red: Red interna
- Nombre de la red interna: el mismo que el servidor

Si cliente y servidor no están en la misma red interna,
la conexión SSH no funcionará.

--------------------------------------------------

4. USO DEL SCRIPT
-----------------

4.1 Dar permisos de ejecución
-----------------------------
Desde la carpeta SSH:

   chmod +x ssh.sh

--------------------------------------------------

4.2 Ejecutar el script
----------------------
Ejecutar el script con:

   ./ssh.sh

Al ejecutarse, el script:
- Actualiza el sistema
- Instala openssh-server
- Activa el servicio SSH
- Muestra un menú de opciones

--------------------------------------------------

5. OPCIONES DEL MENÚ
-------------------

1) Poner IP en enp0s8 (red interna)
   - Configura una IP fija para el servidor
   - Ejemplo de IP:
     192.168.19.10/24

2) Ver IP de la red interna
   - Muestra la configuración de la interfaz enp0s8

3) Estado del servicio SSH
   - Comprueba que el servicio SSH está activo

4) Cambiar puerto SSH a 356
   - Cambia el puerto SSH por defecto (22) al 356

0) Salir
   - Cierra el script

--------------------------------------------------

6. INSTALACIÓN DEL CLIENTE SSH
------------------------------

6.1 Cliente Linux
-----------------
En la máquina cliente Linux ejecutar:

   sudo apt update
   sudo apt install -y openssh-client

--------------------------------------------------

6.2 Cliente Windows
-------------------
En Windows se puede usar:
- PowerShell (SSH viene instalado por defecto)
- PuTTY

--------------------------------------------------

7. CONEXIÓN DESDE EL CLIENTE
----------------------------

7.1 Comando de conexión
-----------------------
Desde la máquina cliente ejecutar:

   ssh -p 356 USUARIO@IP_DEL_SERVIDOR

Ejemplo:
   ssh -p 356 alberto@192.168.19.10

--------------------------------------------------

8. ERRORES COMUNES
------------------

- Connection refused:
  * El servicio SSH no está activo
  * El puerto no es el correcto
  * El firewall bloquea el puerto

- No route to host:
  * Cliente y servidor no están en la misma red interna

--------------------------------------------------

9. RESUMEN
----------
- El servidor queda configurado mediante el script
- El cliente se conecta al servidor por SSH
- Ambos equipos deben estar en la misma red interna
- El puerto SSH utilizado es el 356
- La conexión siempre se realiza de Cliente a Servidor

--------------------------------------------------

10. COMANDO CLAVE
----------------
ssh -p 356 USUARIO@IP_DEL_SERVIDOR

==============================================
