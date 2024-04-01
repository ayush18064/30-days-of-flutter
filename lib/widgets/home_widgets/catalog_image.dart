import 'package:flutter/material.dart';
import 'package:play/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  // const CatalogaImage({super.key});
  final String imageUrl;

  const CatalogImage({super.key, required this.imageUrl});
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
