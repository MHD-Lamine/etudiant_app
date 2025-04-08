import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddNotePage extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController matiereController = TextEditingController();
  final TextEditingController valeurController = TextEditingController();

  Future<void> ajouterNote() async {
    final response = await http.post(
      Uri.parse("http://localhost:5000/notes"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "etudiant_id": int.parse(idController.text),
        "matiere": matiereController.text,
        "valeur": double.parse(valeurController.text),
      }),
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajouter une note")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: idController,
            decoration: InputDecoration(labelText: "ID Étudiant"),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: matiereController,
            decoration: InputDecoration(labelText: "Matière"),
          ),
          TextField(
            controller: valeurController,
            decoration: InputDecoration(labelText: "Note"),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: ajouterNote,
            child: Text("Ajouter la note"),
          )
        ]),
      ),
    );
  }
}
