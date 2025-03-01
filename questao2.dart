import 'dart:io';

void main() {
  // Tipos de arquivos permitidos
  List<String> tiposPermitidos = ['pdf', 'jpg', 'png', 'docx'];

  print("✨Bem-vindo ao sistema de upload de arquivos!");
  print("Por favor, escolha uma das extensões válidas para o upload:");
  print("- pdf");
  print("- jpg");
  print("- png");
  print("- docx");

  // Loop até receber uma entrada válida
  while (true) {
    stdout.write("\nDigite a extensão do arquivo que deseja enviar: ");
    
    // Fazer o tratamento para minúsculas
    String? entrada = stdin.readLineSync()?.trim().toLowerCase();

    // Verifica se a entrada não é nula e se está na lista de tipos permitidos, so entao seguir.
    if (entrada != null && tiposPermitidos.contains(entrada)) {
      print("Arquivo com a extensão '$entrada' aceito para upload.");
      print("O arquivo está sendo preparado para o upload...");
      break; // Interrompe o loop quando a extensão é válida
    } else {
      // Caso a entrada seja inválida, mostramos uma mensagem de erro amigável e de facil entendimento
      print("\nErro: Tipo de arquivo '$entrada' não permitido.");
      print("Tente novamente com uma das seguintes extensões:");
      print(tiposPermitidos.join(", "));
    }
  }

   // No final, passando pelas tapas anteriores irá mostrar uma mensagem de concluido com suceso
  print("\nUpload concluído com sucesso! Obrigado por usar o nosso sistema.");
}
