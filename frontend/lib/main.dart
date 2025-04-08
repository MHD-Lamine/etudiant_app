import 'package:flutter/material.dart';
import 'pages/add_etudiant_page.dart';
import 'pages/add_note_page.dart';
import 'pages/moyenne_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion Étudiants',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      routes: {
        '/add-etudiant': (context) => AddEtudiantPage(),
        '/add-note': (context) => AddNotePage(),
        '/moyenne': (context) => MoyennePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Application Étudiant")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Ajouter un étudiant"),
              onPressed: () => Navigator.pushNamed(context, '/add-etudiant'),
            ),
            ElevatedButton(
              child: Text("Ajouter une note"),
              onPressed: () => Navigator.pushNamed(context, '/add-note'),
            ),
            ElevatedButton(
              child: Text("Calculer une moyenne"),
              onPressed: () => Navigator.pushNamed(context, '/moyenne'),
            ),
          ],
        ),
      ),
    );
  }
}
