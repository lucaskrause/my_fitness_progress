class Evaluation {
  // informações
  String? altura;
  String? pesoAtual;
  double imc = 0;
  String? classImc;
  String? fatKg;
  String? percentFat;
  String? classFat;
  // medidas
  double? ombro;
  double? torax;
  double? bracoDireito;
  double? bracoEsquerdo;
  double? antebracoDireito;
  double? antebracoEsquerdo;
  double? cintura;
  double? barriga;
  double? quadril;
  double? coxaDireita;
  double? coxaEsquerda;
  double? panturrilhaDireita;
  double? panturrilhaEsquerda;

  Evaluation({
    this.altura,
    this.pesoAtual,
    this.percentFat,
    this.fatKg,
    this.ombro,
    this.torax,
    this.bracoDireito,
    this.bracoEsquerdo,
    this.antebracoDireito,
    this.antebracoEsquerdo,
    this.cintura,
    this.barriga,
    this.quadril,
    this.coxaDireita,
    this.coxaEsquerda,
    this.panturrilhaDireita,
    this.panturrilhaEsquerda,
  });

  Evaluation.fromJson(Map<String, dynamic> json) {
    altura = json['altura_cm'];
    pesoAtual = json['peso_kg'];
    imc = json['imc'];
    classImc = json['class_imc'];
    percentFat = json['percent_fat'];
    classFat = json['class_fat'];
    fatKg = json['fat_kg'];
    ombro = json['ombro'];
    torax = json['torax'];
    bracoDireito = json['braco_direito'];
    bracoEsquerdo = json['braco_esquerdo'];
    antebracoDireito = json['antebraco_direito'];
    antebracoEsquerdo = json['antebraco_esquerdo'];
    cintura = json['cintura'];
    barriga = json['barriga'];
    quadril = json['quadril'];
    coxaDireita = json['coxa_direita'];
    coxaEsquerda = json['coxa_esquerda'];
    panturrilhaDireita = json['panturrilha_direita'];
    panturrilhaEsquerda = json['panturrilha_esquerda'];
  }
}