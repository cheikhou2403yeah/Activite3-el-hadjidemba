import 'package:flutter/material.dart'; 
 
void main() { 
  runApp(const MonAppli()); 
} 
 
class MonAppli extends StatelessWidget { 
  const MonAppli({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return const MaterialApp( 
      debugShowCheckedModeBanner: false, 
      home: PageAccueil(), 
    ); //dart.dev/diagnostics/creation_with_non_type
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
      body: Center( 
        child: Image.asset('assets/images/imagedclic.png') 
      ), 
      floatingActionButton: FloatingActionButton( 
        backgroundColor: Colors.pinkAccent, 
        onPressed: () { 
         //dart.dev/diagnostics/avoid_print('Tu as cliqué dessus'); 
        }, 
        child: const Text('Click', 
          style: TextStyle( 
            color: Colors.white 
          ), 
        ), 
), 
); 
} 
}