// ignore_for_file: prefer_const_constructors, use_super_parameters, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:rutas_verdes/pages/registro.dart';
import 'package:rutas_verdes/pages/navegacion.dart';
import 'package:rutas_verdes/pages/recuperarcontrasena.dart';

void main() => runApp(RutasVerdes());

class RutasVerdes extends StatelessWidget {
  const RutasVerdes({Key? key}) : super(key: key);

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
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://i.pinimg.com/564x/be/0c/2f/be0c2f49aa0cb982db5f5901da20423d.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Titulo(),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    campoUsuario(),
                    SizedBox(height: 10),
                    campoContrasena(),
                    SizedBox(height: 20),
                    botonIniciarSesion(context),
                    SizedBox(height: 40),
                    botonRegistro(context),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Recuperarcontrasena(),
                          ),
                        );
                      },
                      child: Text(
                        "¿Olvidaste tu contraseña?",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Rutas Verdes",
      style: TextStyle(
        color: const Color.fromARGB(255, 0, 0, 0),
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

Widget campoUsuario() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.7),
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Nombre de usuario",
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 15),
        prefixIcon: Icon(Icons.person), // Aquí agregas el ícono
      ),
    ),
  );
}

Widget campoContrasena() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.7),
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Contraseña",
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 15),
        prefixIcon: Icon(Icons.lock), 
      ),
    ),
  );
}

Widget botonIniciarSesion(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Navegacion()),
      );
    },
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: Text(
      "Iniciar Sesión",
      style: TextStyle(fontSize: 18),
    ),
  );
}

Widget botonRegistro(BuildContext context) {
  return OutlinedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => registro()),
      );
    },
    style: OutlinedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      side: BorderSide(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: Text(
      "Registrarse",
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
  );
}
