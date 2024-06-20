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
      "imc": imc,
      "classification": classification,
    };
  }
}