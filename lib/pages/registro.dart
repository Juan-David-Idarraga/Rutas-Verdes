// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';

class registro extends StatelessWidget {
  const registro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text("Registro", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold )),
              Text("Ingrese su datos personales", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold )),
              SizedBox(height: 15),
              campoCorreoRegistro(),
              SizedBox(height: 15),
              campoNombreRegistro(),
              SizedBox(height: 15),
              campoApellidoRegistro(),
              SizedBox(height: 15,),
              campoNicknameRegistro(),
              SizedBox(height: 15,),
              campoContrasenaRegistro(),
              SizedBox(height: 15),
              botonEntrar(),
            ],
          ),
        )
      );
  }
}





Widget campoCorreoRegistro() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Ingrese su correo electronico",
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

Widget campoNombreRegistro() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Ingrese sus Nombres",
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

Widget campoApellidoRegistro() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Ingrese sus Apellidos",
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

Widget campoNicknameRegistro() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Ingrese su nombre de usuario",
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

Widget campoContrasenaRegistro() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Ingrese su contraseña",
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

Widget botonEntrar() {
  return TextButton(
    onPressed: ()=>{
      print("Presionaste el botón")
    },
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      foregroundColor: Colors.white, // Esto establece el color del texto
      backgroundColor: Colors.black, // Esto establece el color de fondo
    ),
    child: Text("Registrarse", style: TextStyle(fontSize: 17, color: Colors.white)),
  );
}

