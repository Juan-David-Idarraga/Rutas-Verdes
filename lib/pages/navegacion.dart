import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:rutas_verdes/pages/menu.dart';
import 'package:rutas_verdes/pages/albumes.dart';
import 'package:rutas_verdes/pages/camara.dart';
import 'package:rutas_verdes/pages/perfilPersonal.dart';

class Navegacion extends StatefulWidget {
  const Navegacion({Key? key}) : super(key: key);

  @override
  _NavegacionState createState() => _NavegacionState();
}

class _NavegacionState extends State<Navegacion> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _SeleccionPag(),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xff6200ee),
        unselectedItemColor: const Color(0xff757575),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _navBarItems,
      ),
    );
  }

  Widget _SeleccionPag() {
    switch (_currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return AlbumesPage();
      case 2:
        return CamaraPage();
      case 3:
        return PerfilPage(); // Cambiamos esto para que muestre PerfilPage
      default:
        return HomePage();
    }
  }
}

final _navBarItems = [
  SalomonBottomBarItem(
    icon: const Icon(Icons.home),
    title: const Text("Menu principal"),
    selectedColor: Colors.purple,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.favorite_border),
    title: const Text("Albumes"),
    selectedColor: Colors.pink,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.camera_alt),
    title: const Text("Cámara"),
    selectedColor: Colors.orange,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.person),
    title: const Text("Perfil"),
    selectedColor: Colors.teal,
  ),
];
