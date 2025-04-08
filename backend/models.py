from sqlalchemy import Column, Integer, String, Float, ForeignKey
from sqlalchemy.orm import relationship
from database import Base

class Etudiant(Base):
    __tablename__ = 'etudiants'
    id = Column(Integer, primary_key=True)
    nom = Column(String, nullable=False)
    notes = relationship("Note", back_populates="etudiant")

class Note(Base):
    __tablename__ = 'notes'
    id = Column(Integer, primary_key=True)
    matiere = Column(String, nullable=False)
    valeur = Column(Float, nullable=False)
    etudiant_id = Column(Integer, ForeignKey("etudiants.id"))
    etudiant = relationship("Etudiant", back_populates="notes")
