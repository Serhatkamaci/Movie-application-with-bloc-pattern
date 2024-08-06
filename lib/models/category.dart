class Category{

  String category_id;
  String category_name;

  Category({required this.category_id, required this.category_name});

  factory Category.fromJson(String key, Map<dynamic, dynamic> json){
    return Category(category_id: key, category_name: json["kategori_ad"]);
  }
}