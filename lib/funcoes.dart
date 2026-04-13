import 'dart:io';
import 'livro.dart';

void cadastrarLivro(List<Livro> livros) {
  stdout.write('Título: ');
  String titulo = stdin.readLineSync()!;

  stdout.write('Autor: ');
  String autor = stdin.readLineSync()!;

  stdout.write('Ano: ');
  int ano = int.parse(stdin.readLineSync()!);

  livros.add(Livro(titulo, autor, ano));

  print('Livro cadastrado com sucesso!');
}

void listarLivros(List<Livro> livros) {
  if (livros.isEmpty) {
    print('Nenhum livro cadastrado.');
    return;
  }

  for (int i = 0; i < livros.length; i++) {
    print('$i - ${livros[i].titulo} - (${livros[i].autor}) - ${livros[i].ano}');
  }
}

void atualizarLivro(List<Livro> livros) {
  if (livros.isEmpty) {
    print('Nenhum livro cadastrado.');
    return;
  }

  listarLivros(livros);

  stdout.write('Digite o índice do livro que deseja atualizar: ');
  int index = int.parse(stdin.readLineSync()!);

  if (index < 0 || index >= livros.length) {
    print('Índice inválido.');
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

void removerLivro(List<Livro> livros) {
  if (livros.isEmpty) {
    print('Nenhum livro cadastrado.');
    return;
  }

  listarLivros(livros);

  stdout.write('Digite o índice do livro que deseja remover: ');
  int index = int.parse(stdin.readLineSync()!);

  if (index < 0 || index >= livros.length) {
    print('Índice inválido.');
    return;
  }

  stdout.write(
    'Tem certeza que deseja remover "${livros[index].titulo}"? (s/n): ',
  );
  String confirmacao = stdin.readLineSync()!.toLowerCase();

  if (confirmacao == 's') {
    livros.removeAt(index);
    print('Livro removido com sucesso!');
  } else {
    print('Remoção cancelada.');
  }
}
