import 'package:flutter/material.dart';
import '../db/db_helper.dart';
import '../model/note.dart';
import 'add_update_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DBHelper db = DBHelper();
  List<Note> notes = [];

  void loadNotes() async {
    notes = await db.getNotes();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mes Notes')),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (_, i) => ListTile(
          title: Text(notes[i].title),
          subtitle: Text(notes[i].description),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              await db.deleteNote(notes[i].id!);
              loadNotes();
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddUpdateScreen()),
          );
          loadNotes();
        },
      ),
    );
  }
}
