import 'dart:io';

// Lista global para armazenar os produtos cadastrados
List<Map<String, String>> estoque = [];

// Lista de categorias permitidas
List<String> categoriasValidas = ["eletrônicos", "alimentos", "vestuário", "livros"];

void main() {
  while (true) {
    print("\n=== Sistema de Gerenciamento de Estoque ===");
    print("1 - Cadastrar novo produto");
    print("2 - Mostrar produtos cadastrados");
    print("3 - Sair");
    stdout.write("Escolha uma opção: ");
    
    String? opcao = stdin.readLineSync()?.trim();
    
    if (opcao == "1") {
      cadastrarProduto();
    } else if (opcao == "2") {
      mostrarProdutosCadastrados();
    } else if (opcao == "3") {
      print("\n✅ Sistema encerrado.");
      break;
    } else {
      print("\n❌ Opção inválida. Tente novamente.");
    }
  }
}

/// Função para solicitar e validar a categoria do produto
String solicitarCategoria() {
  while (true) {
    stdout.write("\nDigite a categoria do produto (${categoriasValidas.join(", ")}): ");
    String? categoria = stdin.readLineSync()?.trim().toLowerCase();

    if (categoria != null && categoriasValidas.contains(categoria)) {
      return categoria;
    }

    print('\n❌ Erro: Categoria inválida! Escolha entre: ${categoriasValidas.join(", ")}.');
  }
}

/// Função para cadastrar um novo produto
void cadastrarProduto() {
  stdout.write("\nDigite o nome do produto: ");
  String? nomeProduto = stdin.readLineSync()?.trim();

  if (nomeProduto == null || nomeProduto.isEmpty) {
    print("\n❌ Erro: O nome do produto não pode ser vazio.");
    return;
  }

  String categoriaValida = solicitarCategoria();

  // Adiciona o produto ao estoque
  estoque.add({"nome": nomeProduto, "categoria": categoriaValida});
  print('\n✅ Produto "$nomeProduto" cadastrado na categoria "$categoriaValida".');
}

/// Função para exibir os produtos cadastrados
void mostrarProdutosCadastrados() {
  if (estoque.isEmpty) {
    print("\n📂 Nenhum produto cadastrado.");
    return;
  }

  print("\n=== Produtos Cadastrados ===");
  for (int i = 0; i < estoque.length; i++) {
    print("${i + 1}. ${estoque[i]["nome"]} - Categoria: ${estoque[i]["categoria"]}");
  }
}