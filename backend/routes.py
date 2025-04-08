from flask import Blueprint, request, jsonify
from models import Etudiant, Note
from database import SessionLocal

routes = Blueprint("routes", __name__)
db = SessionLocal()

@routes.route("/etudiants", methods=["POST"])
def add_etudiant():
    nom = request.json.get("nom")
    if not nom:
        return jsonify({"error": "Nom requis"}), 400
    etudiant = Etudiant(nom=nom)
    db.add(etudiant)
    db.commit()
    return jsonify({"message": "Étudiant ajouté", "id": etudiant.id})

@routes.route("/notes", methods=["POST"])
def add_note():
    data = request.json
    note = Note(
        matiere=data.get("matiere"),
        valeur=data.get("valeur"),
        etudiant_id=data.get("etudiant_id")
    )
    db.add(note)
    db.commit()
    return jsonify({"message": "Note ajoutée"})

@routes.route("/etudiants/<int:id>/moyenne", methods=["GET"])
def get_moyenne(id):
    notes = db.query(Note).filter(Note.etudiant_id == id).all()
    if not notes:
        return jsonify({"moyenne": 0})
    moyenne = sum(n.valeur for n in notes) / len(notes)
    return jsonify({"moyenne": moyenne})
