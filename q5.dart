/* 
5. Faça um programa que cadastre 15 números, não permitindo números repetidos.
Ordene-os em seguida, verifique se um número digitado pelo usuário está no vetor. Caso
encontre, verifique se está em uma posição par ou ímpar do vetor.
a) usando busca sequencial;
b) usando busca binária;
*/

import 'dart:io';

void main() {
  List<int> numeros = [];
  Set<int> numerosSet = {};

  print('Digite 15 números diferentes:');
  for (int i = 0; i < 15; i++) {
    int numero;
    do {
      print('Número ${i + 1}:');
      numero = int.parse(stdin.readLineSync()!);
      if (numerosSet.contains(numero)) {
        print('Número já cadastrado. Digite outro número.');
      }
    } while (numerosSet.contains(numero));
    numeros.add(numero);
    numerosSet.add(numero);
  }

  numeros.sort();

  print('Números ordenados:');
  print(numeros);

  print('Digite um número para buscar no vetor:');
  int numeroBusca = int.parse(stdin.readLineSync()!);
  int posicaoSequencial = buscaSequencial(numeros, numeroBusca);
  if (posicaoSequencial != -1) {
    print('O número $numeroBusca foi encontrado na posição $posicaoSequencial (Índice: ${posicaoSequencial - 1}).');
    print('Esta posição é ${posicaoSequencial % 2 == 0 ? 'par' : 'ímpar'} no vetor.');
  } else {
    print('O número $numeroBusca não foi encontrado no vetor.');
  }

  int posicaoBinaria = buscaBinaria(numeros, numeroBusca);
  if (posicaoBinaria != -1) {
    print('Usando busca binária, o número $numeroBusca foi encontrado na posição $posicaoBinaria (Índice: ${posicaoBinaria - 1}).');
    print('Esta posição é ${posicaoBinaria % 2 == 0 ? 'par' : 'ímpar'} no vetor.');
  } else {
    print('Usando busca binária, o número $numeroBusca não foi encontrado no vetor.');
  }
}

int buscaSequencial(List<int> lista, int valor) {
  for (int i = 0; i < lista.length; i++) {
    if (lista[i] == valor) {
      return i + 1;
    }
  }
  return -1;
}

int buscaBinaria(List<int> lista, int valor) {
  int inicio = 0;
  int fim = lista.length - 1;

  while (inicio <= fim) {
    int meio = ((inicio + fim) / 2).floor();
    if (lista[meio] == valor) {
      return meio + 1;
    } else if (lista[meio] < valor) {
      inicio = meio + 1;
    } else {
      fim = meio - 1;
    }
  }
  return -1;
}
