import 'dart:io';
import 'livro.dart';

//Cadastrar Livros

void cadastrarLivro(List<Livro> livros) {
  // Cria a função puxando a lista como paramêtro
  stdout.write('Título: ');
  String titulo = stdin
      .readLineSync()!; //Adiciona a string título o que foi escrito no terminal

  stdout.write('Autor: ');
  String autor = stdin
      .readLineSync()!; //Adiciona a string autor o que foi escrito no terminal

  stdout.write('Ano: ');
  int ano = int.parse(
    stdin.readLineSync()!,
  ); //Adiciona a string ano o que foi escrito no terminal

  livros.add(Livro(titulo, autor, ano)); //Cria o objeto Livro

  print('Livro cadastrado com sucesso!');
}

// Listar Livros

void listarLivros(List<Livro> livros) {
  if (livros.isEmpty) {
    //Executa a linha abaixo caso a lista esteja vazia
    print('Nenhum livro cadastrado.');
    return;
  }

  for (int i = 0; i < livros.length; i++) {
    //estrutura de repetição para listar os livros
    print('$i - ${livros[i].titulo} - (${livros[i].autor}) - ${livros[i].ano}');
  }
}

// Atualizar Livros

void atualizarLivro(List<Livro> livros) {
  if (livros.isEmpty) {
    //Executa a linha abaixo caso a lista esteja vazia
    print('Nenhum livro cadastrado.');
    return;
  }

  listarLivros(livros);

  stdout.write('Digite o índice do livro que deseja atualizar: ');
  int index = int.parse(
    stdin.readLineSync()!,
  ); // Cria uma variável para usar como índice, pega o que foi escrito e armazena nela

  if (index < 0 || index >= livros.length) {
    // Verifica se o índice informado é válido
    return;
  }

  stdout.write('Novo título: ');
  String titulo = stdin.readLineSync()!;

  stdout.write('Novo autor: ');
  String autor = stdin.readLineSync()!;

  stdout.write('Novo ano: ');
  int ano = int.parse(stdin.readLineSync()!);

  livros[index] = Livro(titulo, autor, ano);

  print('Livro atualizado com sucesso!');
}

// Remover Livros

void removerLivro(List<Livro> livros) {
  if (livros.isEmpty) {
    //Executa a linha abaixo caso a lista esteja vazia
    print('Nenhum livro cadastrado.');
    return;
  }

  listarLivros(livros);

  stdout.write('Digite o índice do livro que deseja remover: ');
  int index = int.parse(stdin.readLineSync()!);

  if (index < 0 || index >= livros.length) {
    print('Índice inválido.'); // Verifica se o índice informado é válido
    return;
  }

  stdout.write(
    'Tem certeza que deseja remover "${livros[index].titulo}"? (s/n): ',
  );
  String confirmacao = stdin
      .readLineSync()!
      .toLowerCase(); // Garante que não seja nulo, lê o que foi escrito e converte para minísculos

  if (confirmacao == 's') {
    livros.removeAt(index);
    print('Livro removido com sucesso!');
  } else {
    print('Remoção cancelada.');
  }
}
