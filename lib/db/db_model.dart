import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.name,
    required this.gender,
    required this.location,
    required this.email,
    required this.age,
    required this.phone,
  });

  String name;
  String gender;
  String location;
  String email;
  String age;
  String phone;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    name: json["name"],
    gender: json["gender"],
    location: json["location"],
    email: json["email"],
    age: json["age"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "gender": gender,
    "location": location,
    "email": email,
    "age": age,
    "phone": phone,
  };
}