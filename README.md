Conectate vía ssh a tus contenedores para gestionarlos
======================================================

# Referencia rápida

-	**Web Yonier Gómez**:  
	[Sitio oficial de Neytor](https://www.neytor.com) web en construcción.
  
# ¿Qué es  ssh?

SSH o Secure Shell, es un protocolo de administración remota que permite a los usuarios controlar y modificar sus servidores remotos a través de Internet. 

> [wikipedia.org/wiki/Secure_Shell)](https://es.wikipedia.org/wiki/Secure_Shell)

![logo](https://miro.medium.com/max/544/0*mqE9-fHbs78SweX_.png)


# ¿Cómo usar esta imagen?

## Crear container y exponer el puerto 22

```console
$ docker run --name ssh -dti -p 22:22 neytor/ssh
```
## Crear container y exponer el puerto 2222

```console
$ docker run  --name ssh -dti -p 2222:22 neytor/ssh
```
## ¿Cómo consultar la ip de mi contenedor?

```console
$ docker inspect ssh
```

## Conectarse vía ssh desde mi terminal

Para la conexión vía ssh se utiliza el usuario labo o root con password labo

```console
$ ssh -i labo #ipdelamáquinadondecorremicontenedor -p 2222
```

## ¿Utilizas Selinux? crear contenedor con privilegios

```console
$ docker run --name ssh -dti -p 2222:22 --privileged neytor/ssh
$ docker run --name ssh -dti -p 22:22 --privileged neytor/ssh

Opcional: Habilitar contexto container_file_t
```

## Te invito a visitar mi web
Puedes ver nuevos eventos en [https://www.neytor.com/](https://www.neytor.com).
