/*
4. Faça um programa que cadastre 8 alunos. Para cada aluno devem ser cadastrados:
nome, nota 1 e nota 2. Primeiro, liste todos os alunos cadastrados ordenando-os pela média
ponderada das notas, tendo a primeira nota peso 2 e a segunda peso 3. Em seguida,
ordene os alunos, de forma crescente, pela nota 1, e liste-os. Finalmente, considerando que
para ser aprovado o aluno deve ter no mínimo média 7, liste, em ordem alfabética, os
alunos reprovados.
*/

import 'dart:io';

class Aluno {
  String nome;
  double nota1;
  double nota2;

  Aluno(this.nome, this.nota1, this.nota2);

  double calcularMediaPonderada() {
    return (nota1 * 2 + nota2 * 3) / 5;
  }
}

void main() {
  List<Aluno> alunos = [];

  for (int i = 0; i < 8; i++) {
    print('Cadastro do aluno ${i + 1}:');
    print('Nome: ');
    String nome = stdin.readLineSync()!;
    print('Nota 1: ');
    double nota1 = double.parse(stdin.readLineSync()!);
    print('Nota 2: ');
    double nota2 = double.parse(stdin.readLineSync()!);

    alunos.add(Aluno(nome, nota1, nota2));
  }

  alunos.sort((a, b) => b.calcularMediaPonderada().compareTo(a.calcularMediaPonderada()));

  print('Alunos ordenados pela média ponderada:');
  alunos.forEach((aluno) {
    print('${aluno.nome}: ${aluno.calcularMediaPonderada()}');
  });

  alunos.sort((a, b) => a.nota1.compareTo(b.nota1));

  print('Alunos ordenados pela nota 1:');
  alunos.forEach((aluno) {
    print('${aluno.nome}: Nota 1 - ${aluno.nota1}, Nota 2 - ${aluno.nota2}');
  });

  List<Aluno> reprovados = alunos.where((aluno) => aluno.calcularMediaPonderada() < 7).toList();
  reprovados.sort((a, b) => a.nome.compareTo(b.nome));
  print('Alunos reprovados:');
  reprovados.forEach((aluno) {
    print('${aluno.nome}: ${aluno.calcularMediaPonderada()}');
  });
}
