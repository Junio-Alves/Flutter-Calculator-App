class Historico {
  List<String> _historico = [];
  List<String> _historicos = [];

  //concatena tudo que é digitado dentro de uma string _historico
  concatStrings(String digito) {
    _historico.add(digito);
  }

  //Passa a string _historico para uma lista
  historicosToList(String historicoFinal) {
    _historicos.add(historicoFinal);
    _historicos = _historicos.reversed.toList();
    clearHistorico();
  }

  //getters
  getHistorico() => _historico.join();
  getHistoricosList() => _historicos;

  //limpa toda a string historico
  clearHistorico() {
    _historico.clear();
  }

  clearHistoricoList() {
    _historicos = [];
  }
}
