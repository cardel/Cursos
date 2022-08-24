# Generador de bancos de preguntas con Látex

Este archivo de Latex se utiliza para crear bancos de preguntas en Moodle de forma rápida, evitando problemas por la interfaz poco amigable para la creación de preguntas y las latencias del servidor. Este ha sido probado en el campus virtual de la Universidad del Valle.

Varias cosas

* Tener instalado el paquete moodle en Latex, este suele venir en el paquete prinicipal.
* Tener instalado openssl para codificar imágenes en img64
* Debe compilar desde la consola o configurar el programa que utilice para que agregue -shell-escape para que las imágenes compilen correctamente.
* Debe compilar así:  `pdflatex -shell-escape plantilla.tex` Cambie el nombre de plantilla por el del archivo que esté usando.

Agredecimientos (https://www.ctan.org/pkg/moodle) creado por Anders O.F Hendrickson.

Cualquier duda me puede escribir a carlos.andres.delgado@correounivalle.edu.co

## Importante

En las preguntas de opción multiple con varias respuestas debe colocar el peso negativo en el XML generado o editar directamente en Moodle, de lo contrario si un estudiante marca todas la tomará como correcta.
```Tex
\begin{multi}[multiple]{Nombre de la pregunta}

Texto de la preginta

\item* a
\item* b
\item* c
\item d
\item e
\end{multi}
```
