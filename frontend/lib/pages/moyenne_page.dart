import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoyennePage extends StatefulWidget {
  @override
  _MoyennePageState createState() => _MoyennePageState();
}

class _MoyennePageState extends State<MoyennePage> {
  final TextEditingController idController = TextEditingController();
  String moyenne = "";

  Future<void> getMoyenne() async {
    final id = idController.text;
    final response = await http
        .get(Uri.parse("http://localhost:5000/etudiants/$id/moyenne"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        moyenne = "Moyenne: ${data['moyenne'].toStringAsFixed(2)}";
      });
    } else {
      setState(() {
        moyenne = "Erreur lors du calcul";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculer la moyenne")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: idController,
            decoration: InputDecoration(labelText: "ID Étudiant"),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: getMoyenne,
            child: Text("Calculer"),
          ),
          SizedBox(height: 20),
          Text(moyenne, style: TextStyle(fontSize: 18)),
        ]),
      ),
    );
  }
}
