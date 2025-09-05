void main(List<String> args) {

  // função anônima (closure)
  var resultado = (int x) {
    return x * 2;
  };

  print(resultado(5));

}