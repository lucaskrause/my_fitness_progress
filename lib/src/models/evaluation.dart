import 'package:my_fitness_progress/src/models/anthropometrics.dart';

class Evaluation {
  int id = 0;
  String? altura;
  String? pesoAtual;
  double imc = 0;
  String? classImc;
  String? fatKg;
  String? percentFat;
  String? classFat;
  Anthropometrics? medidas;

  Evaluation({
    this.id = 0,
    this.altura,
    this.pesoAtual,
    this.percentFat,
    this.fatKg,
    this.medidas,
  });

  Evaluation.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    altura = json['altura'];
    pesoAtual = json['peso'];
    imc = json['imc'];
    classImc = json['class_imc'];
    percentFat = json['percent_fat'];
    classFat = json['class_fat'];
    fatKg = json['fat_kg'];
    medidas = json['medidas'] == null
        ? null
        : Anthropometrics.fromJson(json['medidas']);
  }

  Map<String, dynamic> toJson() {
    return {
      'altura': altura,
      'peso': pesoAtual,
      'imc': imc = 0,
      'class_imc': classImc,
      'fat_kg': fatKg,
      'percent_fat': percentFat,
      'class_fat': classFat,
      'medidas': medidas?.toJson(),
    };
  }
}
