# El repositorio de los campeones.
Siéntente libre en cualquier momento de modificar y usar los comandos de Git que quieras. A fin de cuentas esto es sólamente un repositorio para aprender a usar y trabajar con GitHub.

Se feliz picando código como un enfermo terminal!!

## Índice General
- [Descargar Git](#descargar-git)
- [Configurar Git](#configurar-git)
- [Comprobar configuración de Git](#comprobar-la-configuración-desde-cmd)
- [Flujo de trabajo en Git](#flujo-de-trabajo-de-git)
- [Comandos básicos de Git](#comandos-básicos-de-git)
- [Documentación oficial de Git](https://git-scm.com/doc)


## Descargar Git
Podemos descargar GitHub desde: https://git-scm.com/downloads

## Configurar git
Desde la cmd de Windows. Modificar las siguientes variables:

```
$ git config --global user.name "Tunombre Apellido1 Apellido2"
$ git config --global user.email tumail@tumail.com
```

## Comprobar la configuración desde CMD 
Una vez que se ha modificado la configuración de las variables podemos consultar toda nuestra configuración con el siguiente comando:

```
C:\Users\Samuel>git config --list
diff.astextplain.textconv=astextplain
filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
filter.lfs.process=git-lfs filter-process
filter.lfs.required=true
http.sslbackend=openssl
http.sslcainfo=C:/Program Files/Git/mingw64/ssl/certs/ca-bundle.crt
core.autocrlf=true
core.fscache=true
core.symlinks=false
credential.helper=manager
filter.lfs.clean=git-lfs clean %f
filter.lfs.smudge=git-lfs smudge %f
filter.lfs.required=true
user.name=Tunombre Apellido1 Apellido2
user.email=tumail@tumail.com
```

## Flujo de trabajo de Git

Tu repositorio local esta compuesto por tres "árboles" administrados por git. 
- El primero es tu **Directorio de trabajo** que contiene los archivos
- El segundo es el **Index** que actua como una zona intermedia
- El último es el **HEAD** que apunta al último commit realizado. 

![imagenes del flujo de trabajo en git](./img/git1.png)

## Comandos básicos de Git 
A continuación indicaremos algunos de los comandos básicos de Git para empezar a practicar con repositorios de código

#### git clone
El comando git clone nos permite, como su propio nombre indica, clonar el repositorio desde la red a nuestra máquina local.
Al ejecutarlo por primera vez nos solicitará el login en github

```
git clone https://github.com/apenarui/CloudEliteTeam 
```

En caso de que no estemos autenticados o usemos diferentes credenciales para cada repositorio remoto podemos usar el siguiente comando:

```
git clone https://username@github.com/apenarui/CloudEliteTeam 
```

Esto hará que salte el popout de github para meter la contraseña

También podemos indicar la contraseña en la llamada al comando git clone

``` 
git clone https://username:password@github.com/apenarui/CloudEliteTeam 
```

#### git pull
git pull es un atajo conveniente para realizar tanto **git fetch** y **git merge** en el mismo comando:

```
git pull remotename branchname
Obtiene actualizaciones en línea y las fusiona con tu trabajo local.
```

Como pull realiza una fusión en los cambios recuperados, debes asegurarte de que tu trabajo local esté confirmado antes de ejecutar el comando pull. Si se produce un conflicto de fusión que no puedes resolver, o si decides abandonar la fusión, puedes usar git merge --abort para hacer que la rama vuelva al estado anterior antes de que extrajeras.


#### git status 
Este comando muestra la lista de los archivos que se han cambiado junto con los archivos que están por ser añadidos o comprometidos.
Al ejecutar este comando desde la terminal nos mostrará los ficheros que han sido modificados en nuestro repositorio local.

```
PS C:\Users\myuser\CloudEliteTeam> git status
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")
```

#### git add
El comando git add añade un cambio del directorio de trabajo en el entorno de ensayo. Indica a Git que quieres incluir actualizaciones en un archivo concreto en la próxima confirmación. Sin embargo, git add no afecta al repositorio de manera significativa: en realidad, los cambios no se registran hasta que ejecutas git commit.

Junto con estos comandos, también necesitarás git status para ver el estado del directorio de trabajo y el entorno de ensayo.

```
git add .
```

#### git commit
El comando commit es usado para cambiar a la cabecera. Ten en cuenta que cualquier cambio comprometido no afectara al repertorio remoto. Usa el comando:

```
git commit –m “Message to go with the commit here”
```

#### git push
Este es uno de los comandos más básicos. Un simple push envía los cambios que se han hecho en la rama principal de los repertorios remotos que están asociados con el directorio que está trabajando. Por ejemplo:

```
PS C:\Users\myuser\CloudEliteTeam> git push origin master
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 4 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 1.46 KiB | 1.46 MiB/s, done.
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas
```

#### git log
Nos muestra un log de todos los cambios realizados en nuestro código 

```
PS C:\Users\Samuel\CloudEliteTeam> git log
commit 1dd9a4331b7744508bcb3120cacc408af4d01ae4 (HEAD -> master, origin/master, origin/HEAD)
Author: TuNombre Apellido1 Apellido2 <tumail@tumail.com>
Date:   Thu May 28 15:02:28 2020 +0200

    Probando cosas del gitignore

commit d2051ac9624ebd6690ecade2440c742d11e2ded9
Author: TuNombre Apellido1 Apellido2 <tumail@tumail.com>
Date:   Thu May 28 14:59:37 2020 +0200

    borrar cositas

commit ac77896f5e81fb5cec8c347711f89af32eba6702
Author: TuNombre Apellido1 Apellido2 <tumail@tumail.com>
Date:   Thu May 28 14:53:54 2020 +0200

    Probando el gitignore hasta la saciedad
```

#### git branch
Este comando de git nos muestra un listado de las ramas existentes. 

Con el modificador -a mostramos las ramas de los repositorios local y remoto:

```
$ git branch -a
```

Si solo queremos listar las del repositorio remoto:

```
$ git branch -r
``` 

You may also use the show-branch command for seeing the branches and their commits as follows:
$ git show-branch 