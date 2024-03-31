import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:play/models/catalog.dart';
import 'package:play/widgets/drawer.dart';
import 'dart:convert';
import '../widgets/item_widget.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int days = 31;
  String name = "Coder";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    // print(catalogJson);
    var decodedjson = jsonDecode(catalogJson);
    // print(decodedjson);
    var productsData = decodedjson["products"];
    print(productsData);
    catalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog app"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          // ignore: unnecessary_null_comparison
          child: (catalogModel.items != null)
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    final item = catalogModel.items[index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GridTile(
                        header: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        footer: Container(
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            item.price.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: Image.network(item.imgUrl),
                      ),
                    );
                  },
                  itemCount: catalogModel.items.length,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )), //this means that only those items will be rendered that are present on the screen
      drawer: const MyDrawer(),
    );
  }
}
