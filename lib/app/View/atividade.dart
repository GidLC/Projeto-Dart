/*Definições:
Future: É uma classe que realiza uma ação futura, que será realizada de forma independente da sequência de escrita
Await/Sync: São duas ferramentas sintaticas de uso conjunto, que tem por objetivo executar um determinado código 
assincrono de forma semelhante a uma estrutura sincrona.
Programação Assíncrona: Difere-se da programação sincrona no sentido de que esta não está presa a uma ordem especifica
para a relização de suas ações.
*/

import 'dart:io';

/*void main() async {
  await imprimir1();
  await imprimir2();
  await imprimir3();
  await imprimir4();
}

Future imprimir1() {
  return Future.delayed(Duration(seconds: 3), () => print('25%'));
}

Future imprimir2() {
  return Future.delayed(Duration(seconds: 6), () => print('50%'));
}

Future imprimir3() {
  return Future.delayed(Duration(seconds: 9), () => print('75%'));
}

Future imprimir4() {
  return Future.delayed(Duration(seconds: 12), () => print('100%'));
}*/

/*void main() {
  imprimir();
  print('Inicio');
  print('Meio');
  print('Fim');
}

imprimir() {
  return Future.delayed(Duration(seconds: 10), () => print('Texto Completo'));
}*/

void main() async {
  print('Qual o resultado da equação 25+6*(0*2)?');
  var teclado = stdin.readLineSync();
  if (teclado == '0') {
    correta();
  } else {
    errada();
  }
}

correta() {
  return Future.delayed(Duration(seconds: 10), () => print('Resposta Correta'));
}

errada() {
  return Future.delayed(Duration(seconds: 10), () => print('Resposta Errada'));
}