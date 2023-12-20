import 'package:flutter/material.dart';
import 'src/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("A 2 S V"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
      ),
      drawer: const MyDrawer(),
    );
  }
}
