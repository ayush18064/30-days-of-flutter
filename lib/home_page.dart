import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int days = 31;
    String name = "Coder";

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog app"),
      ),
      body: Center(
        child: Container(
          child: Text("welcome ${name} to day ${days} "),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
