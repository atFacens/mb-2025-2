// abstract class ContaBancaria { cria uma classe abstrata

class ContaBancaria {
  double _saldo = 0;

  double get saldo => _saldo;

  void deposito(double valor) {
    if(valor > 0) {
      _saldo += valor;
    }
  }

  void saque(double valor) {
    if(valor > 0 && _saldo >= valor) {
      _saldo -= valor;
    }
  }
}

class ContaEspecial extends ContaBancaria {
    @override
    void saque(double valor) {
    if(valor > 0) {
      _saldo -= valor;
    }
  }
}

void main(List<String> args) {
  var conta = ContaBancaria();
  var contaEspecial = ContaEspecial();

  conta.deposito(100);
  contaEspecial.deposito(100);

  conta.saque(200);
  contaEspecial.saque(200);

  print('O valor do saldo da conta é ${conta.saldo} ');
  print('O valor do saldo da conta Especial é ${contaEspecial.saldo} ');
}