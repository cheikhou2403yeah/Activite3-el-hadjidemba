import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final TextEditingController _controller = TextEditingController();
  List<String> notes = [];
  int? noteEnCours; // index de la note à modifier

  void ajouterOuModifier() {
    if (_controller.text.isEmpty) return;

    setState(() {
      if (noteEnCours == null) {
        notes.add(_controller.text); // AJOUT
      } else {
        notes[noteEnCours!] = _controller.text; // MODIFICATION
        noteEnCours = null;
      }
      _controller.clear();
    });
  }

  void modifierNote(int index) {
    setState(() {
      _controller.text = notes[index];
      noteEnCours = index;
    });
  }

  void supprimerNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mes Notes")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Nouvelle note",
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: ajouterOuModifier,
              child: Text(noteEnCours == null ? "Ajouter" : "Modifier"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(notes[index]),
                    onTap: () => modifierNote(index), // CLIQUE = MODIFIER
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => supprimerNote(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
