class Dominio_Excecao implements Exception {
  String causa = "";

  Dominio_Excecao(this.causa);

  @override
  String toString() {
    return causa;
  }
}
