# bmx-serverstats
Passes butter… I mean status about your server

Sólo necesitas configurar una cosa, la variable BMXINTERFACE. Aquí tendras que poner la "interfaz" de red que quieres monitorear. En CentOS y RHEL 7.x puedes ver tus interfaces con el comando **ip addr**. Te aparece una lista con algo como *1: NOMBREDELAINTERFAZ:  <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000*. Si te gusta una interfaz visual puedes intentar correr *nmtui*.

Puedes copiarlo a tu carpeta personal o a */usr/local/sbin*, realmente no importa.

No necesita *sudo* para ejecutar.

De ahí puedes hacer un comando en /etc/crontab para imprimir un archivo con el texto, que sea accedible mediante HTTP, por ejemplo:

* * * * * root sh -c '/home/USUARIO/bmx-serverstats/bmx_serverstats.sh > /var/www/html/stats/server'

Esto va a imprimir el resultado en un archivo llamado server en (lo que sería la intalación default de) una carpeta stats de Apache. Necesitas crear la carpeta (permisos 755) y el archivo (permisos 744). Si creaste el archivo con root, probablemente necesitas cambiar los permisos a apache:apache, dependiendo de la configuracin de tu servidor.

También te recomiendo poner un .htaccess limitando el acceso:

  AuthName "Restricted Area" 
  AuthType Basic 
  AuthUserFile /DIRECTORIO/.htpasswd 
  AuthGroupFile /dev/null 
  require valid-user
  
 Y el password con usuario en .htpasswd. Aquí puedes generarlos: http://www.htaccesstools.com/htpasswd-generator/
