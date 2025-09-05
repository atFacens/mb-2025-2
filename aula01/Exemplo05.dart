void main(List<String> args) {
  // com repetição
  List<int> lista = [1, 2, 3, 4, 5, 6, 7, 5, 4, 3, 2, 1];

  // Sem repetição
  Set<int> lista2 = {1, 2, 3, 4, 5, 6, 7, 5, 4, 3, 2, 1};

  for (var numero in lista2) {
    print(numero);
  }
}