import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:play/models/catalog.dart';
import 'package:play/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Mythemes.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: const EdgeInsets.all(20),
          children: [
            "\$${catalog.price}".text.bold.xl3.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                backgroundColor: MaterialStateProperty.all(Mythemes.darkBLue),
                foregroundColor: MaterialStateProperty.all(Mythemes.creamColor),
              ),
              child: "Buy".text.make(),
            ).wh(100, 50)
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.imgUrl),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
                width: context.screenWidth,
                color: Colors.white,
                child: Column(
                  children: [
                    catalog.name.text.xl4.color(Mythemes.darkBLue).bold.make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    HeightBox(10)
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
