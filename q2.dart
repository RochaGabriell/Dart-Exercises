/* 
2. Faça um programa que cadastre 10 números, ordene-os e em seguida encontre e mostre:
a) o menor número e quantas vezes ele aparece no vetor;
b) o maior número e quantas vezes ele aparece no vetor. 
*/

import 'dart:io';

void main() {
  List<int> numeros = [];

  for (int i = 0; i < 10; i++) {
    print('Digite o Nº ${i + 1}: ');
    int numero = int.parse(stdin.readLineSync()!);
    numeros.add(numero);
  }

  numeros.sort();

  int menorNumero = numeros[0];
  int maiorNumero = numeros[numeros.length - 1];

  int frequenciaMenor = numeros.where((num) => num == menorNumero).length;
  int frequenciaMaior = numeros.where((num) => num == maiorNumero).length;

  print('Lista: $numeros');
  print('Menor número: $menorNumero, frequência: $frequenciaMenor');
  print('Maior número: $maiorNumero, frequência: $frequenciaMaior');
}
