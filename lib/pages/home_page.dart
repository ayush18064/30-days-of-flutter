// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:play/widgets/home_widgets/catalog_header.dart';
import 'package:play/widgets/home_widgets/catalog_list.dart';

import 'package:velocity_x/velocity_x.dart';

import 'package:play/models/catalog.dart';

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
                const CatalogList().py12().expand(),
              if (isLoading ||
                  catalogModel.items == null ||
                  catalogModel.items.isEmpty)
                CircularProgressIndicator().centered().py16().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
