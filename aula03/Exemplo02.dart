// Registros

// (int, {String nome, bool ativo}) info
// int e posicional

({int cod, String nome, bool ativo}) receberUsuario() {
  int cod = 43;
  String nome = 'Carlos';
  bool ativo = true;

  return (cod:cod, nome:nome , ativo:ativo);
}


void main(List<String> args) {
  // var info = (43, nome:'Carlos', ativo: true);
  var info = receberUsuario();

  print(info);
  print(info.cod);
  print(info.nome);
  print(info.ativo);
}