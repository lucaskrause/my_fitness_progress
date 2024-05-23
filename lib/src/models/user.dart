class User {
  final String name; 
  final int age;
  final int height;

  User({
    this.name = "",
    this.age = 0,
    this.height = 0,
  });

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      age: json['age'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'height': height,
    };
  }
}