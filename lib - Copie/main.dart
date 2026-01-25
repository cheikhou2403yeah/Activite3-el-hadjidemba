import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// ---------------- APP ----------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

/// ---------------- LOGIN PAGE ----------------
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void _login() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotesInterface()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Connexion")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset("assets/notes.png", height: 150),
            TextField(
              controller: _userController,
              decoration: const InputDecoration(labelText: "Utilisateur"),
            ),
            TextField(
              controller: _passController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Mot de passe"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text("Se connecter"),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------- NOTES INTERFACE ----------------
class NotesInterface extends StatefulWidget {
  const NotesInterface({super.key});

  @override
  State<NotesInterface> createState() => _NotesInterfaceState();
}

class _NotesInterfaceState extends State<NotesInterface> {
  List<String> notes = [];

  final TextEditingController controller = TextEditingController();
  int? selectedIndex;

  /// ➕ Ajouter une note
  void ajouterNote() {
    if (controller.text.isNotEmpty) {
      setState(() {
        notes.add(controller.text);
        controller.clear();
      });
    }
  }

  /// 📝 Modifier une note
  void modifierNote() {
    if (selectedIndex != null && controller.text.isNotEmpty) {
      setState(() {
        notes[selectedIndex!] = controller.text;
        controller.clear();
        selectedIndex = null;
      });
    }
  }

  /// ❌ Supprimer une note
  void supprimerNote(int index) {
    setState(() {
      notes.removeAt(index);
      controller.clear();
      selectedIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do list'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            /// LISTE DES NOTES
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(notes[index]),
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          controller.text = notes[index];
                        });
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => supprimerNote(index),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            /// CHAMP TEXTE
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Ajouter ou modifier une note',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            /// BOUTONS
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: ajouterNote,
                    child: const Text('Ajouter'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: modifierNote,
                    child: const Text('Modifier'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}