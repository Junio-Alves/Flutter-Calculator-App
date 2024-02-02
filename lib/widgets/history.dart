class Historico {
  String historico = '';
  List<dynamic> historicos = [];

  digitoHistorico(String digito) {
    historico += digito;
    print("historico $historico");
  }

  String getHistorico() {
    return historico;
  }

  historicosToList(String historicoFinal) {
    historicos.add(historicoFinal);
    for (String historico in historicos) {
      print("HistoricoTolist : $historico");
    }
    historicos = historicos.reversed.toList();
    historico = '';
  }
}
