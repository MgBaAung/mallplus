import 'dart:convert';

class MenuCategories {
  final int? id;
  final String? name;
  final String? slug;
  final int? sorting;
  final String? image;
  final String? created_at;
  final String? image_src;
  // final String food_type;
  MenuCategories({
     this.id,
     this.name,
     this.slug,
     this.sorting,
     this.image,
    this.created_at,
    this.image_src,
    // required this.food_type,
  });

  MenuCategories copyWith({
    int? id,
    String? name,
    String? slug,
    int? sorting,
    String? image,
    String? created_at,
    String? image_src,
    // String? food_type,
  }) {
    return MenuCategories(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      sorting: sorting ?? this.sorting,
      image: image ?? this.image,
      created_at: created_at ?? this.created_at,
      image_src: image_src ?? this.image_src,
      // food_type: food_type ?? this.food_type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'slug': slug,
      'sorting': sorting,
      'image': image,
      'created_at': created_at,
      'image_src': image_src,
      // 'food_type': food_type,
    };
  }

  factory MenuCategories.fromJson(Map<String, dynamic> map) {
    return MenuCategories(
      id: map['id'].toInt()??0,
      name: map['name'] ?? '',
      slug: map['slug']??'',
      sorting: map['sorting'].toInt()??0,
      image: map['image']??'',
      created_at: map['created_at']?? '',
      image_src: map['image_src'] ??'',
      // food_type: Food_type.fromMap(map['food_type'] as Map<String, dynamic>),
      // food_type: map['food_type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  // factory MenuCategories.fromJson(Map<String, dynamic> source) => MenuCategories.fromMap(source);

  // @override
  // String toString() {
  //   return 'MenuCategories(id: $id, name: $name, slug: $slug, sorting: $sorting, image: $image, created_at: $created_at, image_src: $image_src)';
  //       // 'food_type: $food_type)';
  // }

  @override
  bool operator ==(covariant MenuCategories other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.slug == slug &&
        other.sorting == sorting &&
        other.image == image &&
        other.created_at == created_at &&
        other.image_src == image_src ;
    // &&
        // other.food_type == food_type;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ slug.hashCode ^ sorting.hashCode ^ image.hashCode ^ created_at.hashCode ^ image_src.hashCode;
    // ^ food_type.hashCode;
  }
}
