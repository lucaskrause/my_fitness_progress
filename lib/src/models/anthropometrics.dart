class Anthropometrics {
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

  Anthropometrics({
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

  Anthropometrics.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    return {
      'ombro': ombro,
      'torax': torax,
      'braco_direito': bracoDireito,
      'braco_esquerdo': bracoEsquerdo,
      'antebraco_direito': antebracoDireito,
      'antebraco_esquerdo': antebracoEsquerdo,
      'cintura': cintura,
      'barriga': barriga,
      'quadril': quadril,
      'coxa_direita': coxaDireita,
      'coxa_esquerda': coxaEsquerda,
      'panturrilha_direita': panturrilhaDireita,
      'panturrilha_esquerda': panturrilhaEsquerda,
    };
  }
}
