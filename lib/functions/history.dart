class Historico {
  List<String> _historico = [];
  List<String> _historicos = [];

  //adicona o numero digitado para lista
  concatStrings(String digito) {
    _historico.add(digito);
  }

  //Passa _historico para uma lista de historicos
  historicosToList(String historicoFinal) {
    _historicos.add(historicoFinal);
    _historicos = _historicos.reversed.toList();
    clearHistorico();
  }

  //getters
  getHistorico() => _historico.join();
  getHistoricosList() => _historicos;

  //limpa _historico
  clearHistorico() {
    _historico.clear();
  }

  //limpa a lista de _historicos
  clearHistoricoList() {
    _historicos = [];
  }
}
