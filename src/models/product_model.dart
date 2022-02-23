import 'dart:convert';

import 'package:collection/collection.dart';

class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.tags,
  });
  final int id;
  final String name;
  final List<String> tags;

  ProductModel copyWith({
    int id,
    String name,
    List<String> tags,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tags': tags,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      tags: List<String>.from(map['tags']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() => 'ProductModel(id: $id, name: $name, tags: $tags)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ tags.hashCode;
}
