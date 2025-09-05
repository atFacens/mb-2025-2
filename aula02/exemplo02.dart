void main() {
  // ? indica a possibilidade 
  String? nome;

  nome = "Emerson";
  print(nome!.length); // ! está garantindo que não é null

  nome = null;
  print(nome?.length); // ? length será acionado somente se nome não for null

  // ?? usa o nome se estiver não null e 'Convidado' se o nome for null
  print(nome ?? 'Convidado'); 
}