class Helper {
  static Map<String, dynamic> calculaIMC(int altura, double peso) {
    double alturaMetros = altura / 100;
    double imc = peso / (alturaMetros * alturaMetros);
    String classification = "";

    if (imc < 18.5) {
      classification = "Baixo peso";
    } else if (imc < 24.99) {
      classification = "Normal";
    } else if (imc < 29.99) {
      classification = "Sobrepeso";
    } else {
      classification = "Obesidade";
    }

    return {
      "imc": imc.toStringAsFixed(2),
      "classification": classification,
    };
  }

  static String classificacaoGordura(double porcentagem) {
    String classification = "";

    if (porcentagem < 7) {
      classification = "Muito baixo";
    } else if (porcentagem > 7 && porcentagem < 13) {
      classification = "Baixo";
    } else if (porcentagem > 13 && porcentagem < 19) {
      classification = "Normal";
    } else if (porcentagem > 19 && porcentagem < 26) {
      classification = "Moderadamente alto";
    } else if (porcentagem > 26 && porcentagem < 33) {
      classification = "Alto";
    } else {
      classification = "Muito alto";
    }

    return classification;
  }
}
