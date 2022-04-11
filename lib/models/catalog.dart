import 'dart:convert';

class CatalogModel {
  static List<Item>? items; //
  // Item(
  //   id: 1,
  //   name: "I Phone 6",
  //   desc: "Apple Mobile",
  //   price: 1500,
  //   imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWspnuommpAzHJdnrxr3nOJQrmN4CJP3DYKw&usqp=CAU"
  // )
  // ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String imageUrl;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.imageUrl,
  });

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? imageUrl,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'desc': desc});
    result.addAll({'price': price});
    result.addAll({'imageUrl': imageUrl});

    return result;
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      price: map['price'] ?? 0,
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        imageUrl.hashCode;
  }
}
