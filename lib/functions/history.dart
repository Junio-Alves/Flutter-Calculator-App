class Historico {
  String _historico = '';
  List<String> _historicos = [];

  //concatena tudo que é digitado dentro de uma string _historico
  concatStrings(String digito) {
    _historico += digito;
  }

  //Passa a string _historico para uma lista
  historicosToList(String historicoFinal) {
    _historicos.add(historicoFinal);
    _historicos = _historicos.reversed.toList();
    clearHistorico();
  }

  //getters
  getHistorico() => _historico;
  getHistoricosList() => _historicos;

  //limpa toda a string historico
  clearHistorico() {
    _historico = '';
  }
}
