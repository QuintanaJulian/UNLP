pasos para setear todo:

generar y logearse con SSH key en git lab:
	- Crear cuenta de gitlab
	- Manderme el nombre a mi a si les doy accesso
	-Cuando ya les de acceso..
	- Instalar git		->		https://git-scm.com/download/win
	- Generrar SSH, poner en consola GIT	->	ssh-keygen -t rsa -b 2048 -C "tu@email.com"
	darle enter todo sin toca nada para mas facil. Lo unico acuerdense de poner bien su mail. Recomiendo en la parte de ingresar contrasena no poner nada y darle enter directo
	- Leer SSH key y guardarla		->	cat $HOME/.ssh/id_rsa.pub 
	- Ingresar SSH key en la cuenta de git

	si es la primera vez tambien pueden configurar: (desde las CLI de git)
	-git config --global user.name "Nombre y Apellido"			si no le pones el "Nombre y Apellido" te lee tu nombre actual
	-git config --global user.email "tu@email.com"

	
	clonar repositorio:
	-Ir al directorio donde vas a querer clonar todo
	-git clone https://gitlab.com/QuintanaJulian/proyecto-is2.git
	Te va a pedir logerte con la web y no se si yo les tendre que autorizar





instalar repo:
	npm install




instalar de:
	https://www.mongodb.com/try/download/compass		MongoDB Shell Download (MSI y todo por defecto)		y		MongoDB Compass Download (GUI)
	https://nodejs.org/en/download/current			NodeJs
	https://www.postman.com/downloads/			PostMan para consultas HTML al back




COMPASS:
sirve para ver las bases de datos y gestionarlas preferentemente tocar desde aca y no desde la web que pueden romper algo

Apenas entral al compass donde dice mongodb://localhost:...
Lo cambian por:
mongodb+srv://quintanjuli:nm8Vir5XC4ow2KWM@cluster0.trqsger.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0
Y le dan a "Save and connect"

direccion de acceso al server de backend (OJO LO QUE TOCAN QUE ES UN SERVER Y TODOS COMPARTIMOS ESA INFORMACION)
mongodb+srv://quintanjuli:nm8Vir5XC4ow2KWM@cluster0.trqsger.mongodb.net/
y por si quieren entender como se compone la url
'mongodb+srv://' + mongo.username + ':' + mongo.password +'@' + mongo.mongoIp + '/' + mongo.mongoDb + '?'+ mongo.params;

OTRA FORMA DE LO MISMO
Apenas entral al compass donde dice mongodb://localhost:...
Lo cambian por:
mongodb+srv://cluster0.trqsger.mongodb.net/?authSource=%24external&authMechanism=MONGODB-X509&retryWrites=true&w=majority&appName=Cluster0
Despues expanden el desplegable de opciones avanzadas
Y donde authenticacion le dan a "X.509"
Posteriormente le dan a "TLS/SSL" y le dan a "ON"
Tildan donde "Use System Certificate Authority"
Y abajo donde "Client Certificate and Key (.pem)" adjuntan el archivo que esta en el repositorio "backend\database\X509-cert-5548456613154801466.pem"
Y le dan a "Save and connect"




POSTMAN
No es necesario configurar nada aca, masque las rutas de acceso. Basicamente es para hacer fetch pero mas rapido sin tener que tocar nada de codigo del front
Para ciertas acciones van a tener que estar logeados por lo que antes ded hacer esos fetch deben hacer un fetch de login con el nivel de privilegios que quieran.
Los datos para mandarle van en body >> raw >> JSON:
{
    "email": "juliq.gmail.com",
    "password": "empleado"
}
abajo van a ver que les aparece lo que devuelve el fetch, esta hecho para que devuelva toda la data pqra que sea mas facil todo ahora, despues se va a limitar






run proyect
	run backend	->	"npm run dev"		en proyecto-2\backend			o para que no se actualize dinamicamente "node server.js" o "npm run start"		start = "node server.js"	dev = "nodedmon server.js"
	run front	->	"npm run start"		en proyecto-2\frontend






unjdqbuv
26441eb3-c11e-4a8f-8218-8a71b7dd6c51




