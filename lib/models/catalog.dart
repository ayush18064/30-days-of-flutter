class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imgUrl;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.imgUrl});
}

final products = [
  Item(
      id: "Codepur001",
      name: "iPhone 12 Pro",
      desc: "Apple iPhone 12th generation",
      price: 999,
      color: "#33505a",
      imgUrl:
          "https://www.techspot.com/images/products/2020/smartphones/org/2020-10-20-product.png")
];
