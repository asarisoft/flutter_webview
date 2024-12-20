class Cofi {
  String? name;
  String? description;
  String? imageUrl;

  Cofi({this.name, this.description, this.imageUrl});

  Cofi.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
