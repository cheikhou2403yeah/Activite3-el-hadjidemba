import 'package:flutter/material.dart';
import '../db/db_helper.dart';
import '../model/note.dart';

class AddUpdateScreen extends StatefulWidget {
  const AddUpdateScreen({super.key});

  @override
  State<AddUpdateScreen> createState() => _AddUpdateScreenState();
}

class _AddUpdateScreenState extends State<AddUpdateScreen> {
  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final DBHelper db = DBHelper();

  void save() async {
    await db.insertNote(
      Note(
        title: _titleCtrl.text,
        description: _descCtrl.text,
        date: DateTime.now().toString(),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter une note')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _titleCtrl, decoration: const InputDecoration(labelText: 'Titre')),
            TextField(controller: _descCtrl, decoration: const InputDecoration(labelText: 'Description')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: save, child: const Text('Enregistrer'))
          ],
        ),
      ),
    );
  }
}
