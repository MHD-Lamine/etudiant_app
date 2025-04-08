import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddEtudiantPage extends StatelessWidget {
  final TextEditingController nomController = TextEditingController();

  Future<void> ajouterEtudiant() async {
    final response = await http.post(
      Uri.parse("http://10.0.2.2:5000/etudiants"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"nom": nomController.text}),
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajouter un étudiant")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: nomController,
            decoration: InputDecoration(labelText: "Nom de l'étudiant"),
          ),
          ElevatedButton(
            onPressed: ajouterEtudiant,
            child: Text("Ajouter"),
          )
        ]),
      ),
    );
  }
}
