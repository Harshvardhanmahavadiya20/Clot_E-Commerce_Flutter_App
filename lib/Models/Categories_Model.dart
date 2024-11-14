class CategoriesModel {
    CategoriesModel({
        required this.id,
        required this.name,
        required this.image,
        required this.creationAt,
        required this.updatedAt,
    });

    final int? id;
    final String? name;
    final String? image;
    final DateTime? creationAt;
    final DateTime? updatedAt;

    factory CategoriesModel.fromJson(Map<String, dynamic> json){ 
        return CategoriesModel(
            id: json["id"],
            name: json["name"],
            image: json["image"],
            creationAt: DateTime.tryParse(json["creationAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
        );
    }


}
