import 'dart:io';

void main() {
  // Função para validar a operação
  String escolherOperacao() {
    while (true) {
      print('Digite uma operação (deposito, retirada, transferencia, pagamento):');
      String? operacao = stdin.readLineSync();
      if (operacao == null || !['deposito', 'retirada', 'transferencia', 'pagamento'].contains(operacao.toLowerCase())) {
        print('Operação inválida. Tente novamente.');
      } else {
        return operacao.toLowerCase();  // Retorna a operação válida
      }
    }
  }

  // Função para validar o valor do depósito (deve ser um número positivo)
  double validarValor() {
    while (true) {
      print('Digite o valor da operação:');
      String? input = stdin.readLineSync();
      try {
        double valor = double.parse(input!);
        if (valor <= 0) {
          print('Valor inválido! O valor deve ser positivo. Tente novamente.');
        } else {
          return valor;  // Retorna o valor válido
        }
      } catch (e) {
        print('Entrada inválida! Por favor, insira um número válido.');
      }
    }
  }

  // Escolhe a operação
  String operacao = escolherOperacao();

  // Valida o valor
  double valor = validarValor();

  // Exibe a operação e o valor
  print('Operação escolhida: $operacao, Valor: $valor');
}
