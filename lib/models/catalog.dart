
class CatalogModel {
  static final items = [
    Item(
      id: 1,
      name: "I Phone 6",
      desc: "Apple Mobile",
      price: 1500,
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWspnuommpAzHJdnrxr3nOJQrmN4CJP3DYKw&usqp=CAU"  
    )
  ];
}


class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String imageUrl;

  Item({this.id=0, this.name="", this.desc="", this.price=0, this.imageUrl=""});
}
