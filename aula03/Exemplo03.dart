Future<String> download() {
  return Future.delayed(Duration(seconds: 3), (){
    return 'Dados recebidos';
  });
}

void main(List<String> args) async {
  print('Aguardando os dados...');

  String resultado = await download();
  
  print(resultado);
}