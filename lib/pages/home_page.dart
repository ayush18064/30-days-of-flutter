// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:play/models/catalog.dart';
import 'package:play/widgets/drawer.dart';
import 'package:play/widgets/themes.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int days = 31;
  String name = "Coder";
  bool isLoading = true; // Track the loading state

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedjson = jsonDecode(catalogJson);
    var productsData = decodedjson["products"];
    print(productsData);
    catalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {
      isLoading = false; // Set loading state to false after data is loaded
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mythemes.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (!isLoading &&
                  catalogModel.items != null &&
                  catalogModel.items.isNotEmpty)
                const CatalogList().expand(),
              if (isLoading ||
                  catalogModel.items == null ||
                  catalogModel.items.isEmpty)
                const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl3.bold.color(Mythemes.darkBLue).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = catalogModel.items[index];
        return CatalogItem(
          catalog: catalog,
        );
      },
      itemCount: catalogModel.items.length,
    );
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogaImage(imageUrl: catalog.imgUrl),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(Mythemes.darkBLue).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.all(20),
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(
                  onPressed: () {},
                  child: "Buy".text.make(),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Mythemes.darkBLue),
                    foregroundColor:
                        MaterialStateProperty.all(Mythemes.creamColor),
                  ),
                )
              ],
            )
          ],
        ))
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}

class CatalogaImage extends StatelessWidget {
  // const CatalogaImage({super.key});
  final String imageUrl;

  const CatalogaImage({super.key, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl)
        .box
        .rounded
        .p8
        .color(Mythemes.creamColor)
        .make()
        .p16()
        .w32(context);
  }
}
