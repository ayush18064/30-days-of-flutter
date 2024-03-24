import 'package:flutter/material.dart';
import 'package:play/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          debugPrint("${item.name} pressed !");
        },
        leading: Image.network(item.imgUrl),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          style: const TextStyle(
              color: Colors.deepPurple,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
