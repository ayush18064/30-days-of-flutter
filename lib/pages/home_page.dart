import 'package:flutter/material.dart';
import 'package:play/models/catalog.dart';
import 'package:play/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(50, (index) => catalogModel.items[0]);
    int days = 31;
    String name = "Coder";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog app"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: dummyList[index],
              );
            }),
      ), //this means that only those items will be rendered that are present on the screen
      drawer: const MyDrawer(),
    );
  }
}
