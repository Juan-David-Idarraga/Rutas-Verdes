// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:rutasverdes/pages/registro.dart';
import 'package:rutasverdes/pages/navegacion.dart'; // Importa el archivo de navegación
import 'package:rutasverdes/pages/recuperarcontasena.dart';


void main() => runApp(RutasVerdes());

class RutasVerdes extends StatelessWidget {
  const RutasVerdes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Rutas Verdes",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(context), // Pasa el contexto aquí
    );
  }
}

Widget cuerpo(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/564x/ac/84/df/ac84dfc6125f5db46dac13bb3e5a0570.jpg"),
            fit: BoxFit.cover)),
    child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Titulo(),
          SizedBox(
            height: 60,
          ),
          campoUsuario(),
          SizedBox(
            height: 15,
          ),
          campoContrasena(),
          SizedBox(
            height: 15,
          ),
          botonIniciarSesion(context), // Pasa el contexto aquí
          SizedBox(
            height: 30,
          ),
          botonRegistro(context), // Pasa el contexto aquí
          SizedBox(
            height: 30,
          ),
          recuperarcontrasena(context),
        ])),
  );
}

Widget Titulo() {
  return Container(
    padding: EdgeInsets.all(8.0), // Agrega un poco de padding
    decoration: BoxDecoration(
      color: Color.fromARGB(186, 255, 255, 255), // Establece el color de fondo
      borderRadius:
          BorderRadius.circular(12.0), // Define los bordes redondeados
    ),
    child: Text(
      "Iniciar Sesión",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget campoUsuario() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 3),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Nombre de usuario",
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Bordes más redondeados
          borderSide: BorderSide.none, // Sin borde exterior
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Bordes más redondeados
          borderSide: BorderSide.none, // Sin borde exterior
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Bordes más redondeados
          borderSide: BorderSide.none, // Sin borde exterior
        ),
      ),
    ),
  );
}

Widget campoContrasena() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 3),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Contraseña",
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Bordes más redondeados
          borderSide: BorderSide.none, // Sin borde exterior
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Bordes más redondeados
          borderSide: BorderSide.none, // Sin borde exterior
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Bordes más redondeados
          borderSide: BorderSide.none, // Sin borde exterior
        ),
      ),
    ),
  );
}

Widget botonIniciarSesion(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Navegacion()), // Redirige a la página de navegación
      );
    },
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      foregroundColor: Colors.white, // Esto establece el color del texto
      backgroundColor: Colors.black, // Esto establece el color de fondo
    ),
    child: Text("Iniciar Sesión",
        style: TextStyle(fontSize: 15, color: Colors.white)),
  );
}

Widget botonRegistro(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => registro()));
    },
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      foregroundColor: Colors.white, // Esto establece el color del texto
      backgroundColor: Colors.black, // Esto establece el color de fondo
    ),
    child: Text("Registrarse",
        style: TextStyle(fontSize: 10, color: Colors.white)),
  );
}

Widget recuperarcontrasena(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Recuperarcontrasena()),
      );
    },
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
    ),
    child: Text(
      "Olvidé mi contraseña",
      style: TextStyle(fontSize: 10, color: Colors.white),
    ),
  );
}
