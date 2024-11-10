class User {
  String name; 
  int age;
  int height;
  double weight;
  Map<String, double>? objective;

  User({
    this.name = "",
    this.age = 0,
    this.height = 0,
    this.weight = 0,
    this.objective,
  });

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      age: json['age'],
      height: json['height'],
      weight: json['weight'],
      objective: json['objective'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'height': height,
      'weight': weight,
      'objective': objective,
    };
  }
}