class ListEntity {
  String name;
  String phoneNumber;
  String age;
  String department;
  String imgUrl;

  ListEntity({
    required this.name,
    required this.phoneNumber,
    required this.age,
    required this.department,
    required this.imgUrl,
  });

  factory ListEntity.fromJson(Map<String, dynamic> json) => ListEntity(
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        age: json["age"],
        department: json["department"],
        imgUrl: json["imgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phoneNumber": phoneNumber,
        "age": age,
        "department": department,
        "imgUrl": imgUrl, 
      };
}
