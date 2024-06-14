// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';

class Recuperarcontrasena extends StatelessWidget {
  const Recuperarcontrasena({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" "),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),

          child: Column(
            children: [
              Text("Olvidaste tu contraseña?", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold )),
              Text("Ingrese los siguientes datos", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold )),
              SizedBox(height: 15),
              campoCorreo(),
              SizedBox(height: 15),
              botonRecuperar()

            ],
          ),
        )
      );
  }
}





Widget campoCorreo() {
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

Widget botonRecuperar() {
  return TextButton(
    onPressed: ()=>{
      print("Presionaste el botón")
    },
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      foregroundColor: Colors.white, // Esto establece el color del texto
      backgroundColor: Colors.black, // Esto establece el color de fondo
    ),
    child: Text("Enviar codigo de recuperación", style: TextStyle(fontSize: 17, color: Colors.white)),
  );
}