import 'package:my_fitness_progress/src/models/anthropometrics.dart';

class Evaluation {
  String? altura;
  String? pesoAtual;
  double imc = 0;
  String? classImc;
  String? fatKg;
  String? percentFat;
  String? classFat;
  Anthropometrics? medidas;

  Evaluation({
    this.altura,
    this.pesoAtual,
    this.percentFat,
    this.fatKg,
    this.medidas,
  });

  Evaluation.fromJson(Map<String, dynamic> json) {
    altura = json['altura_cm'];
    pesoAtual = json['peso_kg'];
    imc = json['imc'];
    classImc = json['class_imc'];
    percentFat = json['percent_fat'];
    classFat = json['class_fat'];
    fatKg = json['fat_kg'];
    medidas = Anthropometrics.fromJson(json['medidas']);
  }
}