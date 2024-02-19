/* 
1. Faça um programa que cadastre o nome e o salário de 5 funcionários. Usando três métodos de 
ordenação diferentes, liste todos os dados dos funcionários das seguintes for mas:
a) em ordem crescente de salário;
b) em ordem decrescente de salário;
e) em ordem alfabética. 
*/

import 'dart:io';

void main() {
  List<Funcionario> funcionarios = [];
  int cont = 5;

  for (int i = 0; i < cont; i++) {
    print('Funcionario Nº - 0$i de 05: ');
    print('Nome: ');
    String nome = stdin.readLineSync()!;

    print('Salário: ');
    double salario = double.parse(stdin.readLineSync()!);

    funcionarios.add(Funcionario(nome, salario));
  }

  funcionarios.sort((a, b) => a.salario.compareTo(b.salario));
  print("Funcionários em ordem crescente de salário: ");
  for (var funcionario in funcionarios) {
    print(funcionario);
  }

  funcionarios.sort((a, b) => b.salario.compareTo(a.salario));
  print("Funcionários em ordem decrescente de salário: ");
  for (var funcionario in funcionarios) {
    print(funcionario);
  }

  funcionarios.sort((a, b) => a.nome.compareTo(b.nome));
  print("Funcionários em ordem alfabética:");
  for (var funcionario in funcionarios) {
    print(funcionario);
  }
}

class Funcionario {
  String nome;
  double salario;

  Funcionario(this.nome, this.salario);

  @override
  String toString() {
    return 'Nome: $nome, Salário: $salario';
  }
}
