import 'dart:ffi';

void main() {
  // declara o tipo implicitamente
  var numero = 5;

  // permite alterar o conteúdo em qualquer momento
  numero = 7;

  // define uma constante
  const TITULO = 'Minha Aplicação';

  // Uma constante não pode ter seu conteúdo alterado
  // TITULO = "Outra coisa"; Erro de compilação

  final valor = 12.5;
  // valor = 5.7; Erro: não permite trocar o valor

  // o final, diferente do const, permite a inicialização posterior
  final c;
  c = 8;

  const List<int> valores = [1, 2, 3];
  valores.add(4);

  // valores = [6,7,8]; // Não posso reatribuir a mesma variável
}