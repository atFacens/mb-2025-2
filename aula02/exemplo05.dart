void main(List<String> args) {
  List<int> lista = [1, 2, 3, 4, 5];

  List<int> pares = lista.where((valor)=>valor % 2 == 1).toList();

  print('Números pares: $pares');
}