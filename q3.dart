/*
3. Faça um programa que cadastre 12 produtos. Para cada produto devem ser cadastrados os seguintes dados: 
código, descrição e preço. Use um método de ordenação e em Seguida calcule e mostre quantas comparações
devem ser feitas para encontrar um produto pelo código:
  a) usando busca sequencial;
  b) usando busca binária.
*/

import 'dart:io';

void main() {
  List<Produto> produtos = [];
  int cont = 5;

  for (int i = 0; i < cont; i++) {
    print('Cadastre o ${i + 1}º produto:');
    print('Código:');
    int codigo = int.parse(stdin.readLineSync()!);

    print('Descrição:');
    String descricao = stdin.readLineSync()!;

    print('Preço:');
    double preco = double.parse(stdin.readLineSync()!);

    produtos.add(Produto(codigo, descricao, preco));
  }

  produtos.sort((a, b) => a.codigo.compareTo(b.codigo));

  print('Produtos cadastrados:');
  for (var produto in produtos) {
    print(produto);
  }

  print('Digite o código do produto que deseja encontrar: ');
  int codigoProcurado = int.parse(stdin.readLineSync()!);

  print('Quantidade de comparações para encontrar um produto pelo código: ');

  int seq = buscaSequencial(produtos, codigoProcurado);
  print('Busca sequencial: $seq comparações');

  int bin = buscaBinaria(produtos, codigoProcurado);
  print('Busca binária: $bin comparações');
}

class Produto {
  int codigo;
  String descricao;
  double preco;

  Produto(this.codigo, this.descricao, this.preco);

  @override
  String toString() {
    return 'Código: $codigo, Descrição: $descricao, Preço: $preco';
  }
}

int buscaSequencial(List<Produto> produtos, int codigoProcurado) {
  int comparacoes = 0;

  for (int i = 0; i < produtos.length; i++) {
    comparacoes++;
    if (produtos[i].codigo == codigoProcurado) {
      return comparacoes;
    }
  }

  return comparacoes;
}

int buscaBinaria(List<Produto> produtos, int codigoProcurado) {
  int comparacoes = 0;
  int inicio = 0;
  int fim = produtos.length - 1;

  while (inicio <= fim) {
    comparacoes++;
    int meio = ((inicio + fim) / 2).floor();
    if (produtos[meio].codigo == codigoProcurado) {
      return comparacoes;
    } else if (produtos[meio].codigo < codigoProcurado) {
      inicio = meio + 1;
    } else {
      fim = meio - 1;
    }
  }

  return comparacoes;
}
