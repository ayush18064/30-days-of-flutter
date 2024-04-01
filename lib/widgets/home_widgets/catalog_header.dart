import 'package:flutter/material.dart';
import 'package:play/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
