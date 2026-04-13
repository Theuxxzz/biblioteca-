import 'dart:io';
import 'package:biblioteca/livro.dart';
import 'package:biblioteca/funcoes.dart';

void main() {
  List<Livro> livros = [];

  while (true) {
    print('\n=== BIBLIOTECA ===');
    print('1 - Cadastrar livro');
    print('2 - Listar livros');
    print('3 - Atualizar livro');
    print('4 - Remover livro');
    print('0 - Sair');

    stdout.write('Escolha uma opção: ');
    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        cadastrarLivro(livros);
        break;

      case '2':
        listarLivros(livros);
        break;

      case '3':
        atualizarLivro(livros);
        break;

      case '4':
        removerLivro(livros);
        break;

      case '0':
        print('Saindo...');
        return;

      default:
        print('Opção inválida!');
    }
  }
}
