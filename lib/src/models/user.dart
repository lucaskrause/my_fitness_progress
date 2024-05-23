class User {
  final String name; 
  final int idade;
  final int altura;

  User({
    this.name = false,
    this.idade = 0,
    this.altura = 0,
  });

  factory User fromMap(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      idade: json['idade'],
      altura: json['altura'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'idade': idade,
      'altura': altura,
    };
  }
}