class CategoryModel {
  String? id;
  String? name;

  CategoryModel({this.id, this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['id'] as String?,
    name: json['name'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}

List<CategoryModel> categorys = [
  CategoryModel()
  ..id = "dev"
  ..name = "Software Development",
  CategoryModel()
  ..id = "AI"
  ..name = "AI & ML",
  CategoryModel()
  ..id = "Data"
  ..name = "Data Science",
  CategoryModel()
  ..id = "Game"
  ..name = "Game Development",
   CategoryModel()
  ..id = "Cybersecurity"
  ..name = "Cybersecurity",
];





