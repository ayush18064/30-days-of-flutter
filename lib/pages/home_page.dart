import 'package:flutter/material.dart';
import 'package:play/widgets/drawer.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int days = 31;
    String name = "Coder";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog app"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          child: Text("welcome $name to day $days "),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
