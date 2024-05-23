class RegisterController {
  RegisterController();

  String nome = "";
  String altura = "";
  String peso = "";

  void setNome(String value) {
    nome = value;
  }

  void setAltura(String value) {
    altura = value;
  }

  void setPeso(String value) {
    peso = value;
  }

  Future<void> saveData() async {
    //TODO: Salvar dados no banco de dados
  }
}