// homePage.dart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            _buildSearchBar(),
            SizedBox(height: 24.0),
            _buildSectionTitle('Destacados'),
            SizedBox(height: 8.0),
            _buildFeaturedItems(),
            SizedBox(height: 24.0),
            _buildSectionTitle('Categorías'),
            SizedBox(height: 8.0),
            _buildCategories(),
            SizedBox(height: 24.0),
            SizedBox(height: 24.0),
            _buildSectionTitle('Últimos Avistamientos'),
            SizedBox(height: 8.0),
            _buildRecentSightings(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Buscar',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[900]),
      ),
    );
  }

  Widget _buildFeaturedItems() {
    // Aquí irían los elementos destacados
    return Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildFeaturedItem('Planta', Icons.eco, Colors.green),
          _buildFeaturedItem('Animal', Icons.pets, Colors.orange),
          _buildFeaturedItem('Insecto', Icons.bug_report, Colors.red),
          // Agrega más elementos aquí
        ],
      ),
    );
  }

  Widget _buildFeaturedItem(String title, IconData icon, Color color) {
    return Container(
      width: 120,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    // Aquí irían las categorías
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategoryItem('Plantas', Icons.eco, Colors.green),
          _buildCategoryItem('Animales', Icons.pets, Colors.orange),
          _buildCategoryItem('Insectos', Icons.bug_report, Colors.red),
          // Agrega más categorías aquí
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon, Color color) {
    return Container(
      width: 120,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentSightings() {
    // Aquí irían los últimos avistamientos
    return Container(
      height: 200,
      child: Placeholder(), // Puedes reemplazar esto con tus últimos avistamientos reales
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}