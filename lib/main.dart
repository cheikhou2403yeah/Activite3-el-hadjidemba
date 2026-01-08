import 'package:flutter/material.dart'; 
 
void main() { 
  runApp(const MonAppli()); 
} 
 
class MonAppli extends StatelessWidget { 
   const MonAppli({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return  MaterialApp( 
      title: 'Magasine Infos',
      debugShowCheckedModeBanner: true, 
     home:(PageAccueil()), 
     // MaterialApp
    ); 
  } 
} 
 
class PageAccueil extends StatelessWidget { 
     const PageAccueil({super.key});
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Magasine Infos', 
          style: TextStyle( 
            color: Colors.white 
          ), 
        ) , 
        backgroundColor: Colors.pinkAccent, 
        centerTitle: true, 
        leading: IconButton( 
          icon: const Icon(Icons.menu,color: Colors.white,), 
          onPressed: (){}, 
        ), 
        actions: [ 
          IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: 
Colors.white,)) 
        ], 
      ), 
      body: SingleChildScrollView(
  child: Column(
    children: const [
      Image(
        image: AssetImage('assets/images/imagedclic.png'),
      ),
      PartieTitre(),
      PartieTexte(),
      PartieIcone(),
      PartieRubrique(),
    ],
  ),
),

            
      //floatingActionButton: FloatingActionButton( 
      // onPressed: () {
      // debugPrint('Tu as cliqué dessus');
      //},
      //backgroundColor: Colors.pink,
      //child: Text('Click'),
    ); // Scaffold
  }
}

class PartieTitre extends StatelessWidget {
  const PartieTitre({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bienvenue sur Magasine Infos',
          style: TextStyle(fontSize:25, fontWeight: FontWeight.w800)
        ),  // Text
        Text(
          "Votre magazine numérique, votre source d'inspiration",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)
        ), // Text
        ],
      ), // Column
    ); // Container
  }  
}

class PartieTexte extends StatelessWidget {
  const PartieTexte({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Text(
         "Magazine Infos est bien plus qu'une simple magazine d'inforamtions."
         "C'est une plateforme où vous pouvez découvrir des articles captivants, "
         "des interviews exclusives, et des analyses approfondies sur une variété de sujets."
         "Que vous soyez passionné par la technologie, la culture, la santé, ou les voyages, "
         "Magazine Infos a quelque chose pour vous.",
         textAlign: TextAlign.justify,
         style: TextStyle(fontSize: 16, height: 1.5
    ), // Container
  ));
  }
}

class PartieIcone extends StatelessWidget {
  const PartieIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Icon(Icons.phone, color: Colors.pink),
                const SizedBox(height: 5),
                Text(
                  'Tel' .toUpperCase(),
                  style: const TextStyle(color: Colors.pink),
                ) // Text
              ],
            ), // Column   
          ), // Container
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Icon(Icons.email, color: Colors.pink),
                const SizedBox(height: 5),
                Text(
                  'Email' .toUpperCase(),
                  style: const TextStyle(color: Colors.pink),
                ) // Text
              ],
            ), // Column   
          ), // Container
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Icon(Icons.share, color: Colors.pink),
                const SizedBox(height: 5),
                Text(
                  'partage' .toUpperCase(),
                  style: const TextStyle(color: Colors.pink),
                ) // Text
              ],
            ), // Column
          ), // conatiner
        ], // children
      ), // Row
    ); // Container
  }
}


class PartieRubrique extends StatelessWidget {
  const PartieRubrique({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> rubriques = [
      {'titre': 'Culture', 'image': 'assets/images/Culture.png'},
      {'titre': 'Lifestyle', 'image': 'assets/images/Lifestyle.png'},
      {'titre': 'Santé', 'image': 'assets/images/Santé.png'},
      {'titre': 'Voyages', 'image': 'assets/images/Voyages.png'},
      {'titre': 'Business', 'image': 'assets/images/Business.png'},
    ];

    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: rubriques.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.asset(
                      rubriques[index]['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    rubriques[index]['titre']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



class ContenuRubrique extends StatelessWidget {
  final String titre;

  const ContenuRubrique({super.key, required this.titre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titre),
      ),
      body: Center(
        child: Text(
          'Contenu de la rubrique $titre',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
