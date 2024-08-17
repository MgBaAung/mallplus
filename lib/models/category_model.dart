class CategorySection {
  int? id;
  String? imageSmall;
  String? imageLarge;
  String? slug;
  String? title;
  String? description;

  CategorySection(
      {this.id,
        this.imageSmall,
        this.imageLarge,
        this.slug,
        this.title,
        this.description});

  CategorySection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageSmall = json['image_small'];
    imageLarge = json['image_large'];
    slug = json['slug'];
    title = json['title'];
    description = json['description']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_small'] = this.imageSmall;
    data['image_large'] = this.imageLarge;
    data['slug'] = this.slug;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}