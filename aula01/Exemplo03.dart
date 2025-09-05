
// int double String bool num var

void main() {
  var n = 12; // n será definido como int
  double resp = n + 12.45;

  int inteiro = resp.toInt();
  
  inteiro++;

  print(inteiro);

  bool teste = (resp > 0 && n > 0);
  print(teste);
}