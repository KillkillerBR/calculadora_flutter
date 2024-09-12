import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MainApp());
}

bool firstOp = true;
bool operacaoEmAndamento = false;
var resultado = 0.0;
var primeiroN = 0.0;
var segundoN = 0.0;
var lastOp = ''; // '+' para soma, '-' para subtração, '*' para multiplicação, '/' para divisão

class MainApp extends StatelessWidget {
  MainApp({super.key});
  var controle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextField(controller: controle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        controle.text += '7';
                      },
                      child: Text('7')),
                  TextButton(
                      onPressed: () {
                        controle.text += '8';
                      },
                      child: Text('8')),
                  TextButton(
                      onPressed: () {
                        controle.text += '9';
                      },
                      child: Text('9')),
                  TextButton(onPressed: soma, child: Text('+')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        controle.text += '4';
                      },
                      child: Text('4')),
                  TextButton(
                      onPressed: () {
                        controle.text += '5';
                      },
                      child: Text('5')),
                  TextButton(
                      onPressed: () {
                        controle.text += '6';
                      },
                      child: Text('6')),
                  TextButton(onPressed: sub, child: Text('-')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        controle.text += '1';
                      },
                      child: Text('1')),
                  TextButton(
                      onPressed: () {
                        controle.text += '2';
                      },
                      child: Text('2')),
                  TextButton(
                      onPressed: () {
                        controle.text += '3';
                      },
                      child: Text('3')),
                  TextButton(onPressed: mult, child: Text('X')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        controle.text += '0';
                      },
                      child: Text('0')),
                  TextButton(
                      onPressed: () {
                        controle.text += '.';
                      },
                      child: Text(',')),
                  TextButton(onPressed: equal, child: Text('=')),
                  TextButton(onPressed: div, child: Text('÷')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        controle.clear();
                        resultado = 0;
                        primeiroN = 0;
                        segundoN = 0;
                        lastOp = '';
                        firstOp = true;
                      },
                      child: Text('AC')),
                  TextButton(
                      onPressed: () {
                        if (controle.text.isNotEmpty) {
                          controle.text = controle.text
                              .substring(0, controle.text.length - 1);
                        }
                      },
                      child: Text('◄')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void soma() {
    realizarOperacao();
    lastOp = '+';
    controle.text = '';
  }

  void sub() {
    realizarOperacao();
    lastOp = '-';
    controle.text = '';
  }

  void mult() {
    realizarOperacao();
    lastOp = '*';
    controle.text = '';
  }

  void div() {
    realizarOperacao();
    lastOp = '/';
    controle.text = '';
  }

  void equal() {
    realizarOperacao(); // Faz o cálculo final baseado na última operação
    controle.text = resultado.toString();
    lastOp = ''; // Reinicia a operação após mostrar o resultado
    firstOp = true; // Permite um novo cálculo
  }

  // Função para realizar a operação imediatamente
  void realizarOperacao() {
    if (controle.text.isNotEmpty) {
      segundoN = double.parse(controle.text);
      if (firstOp) {
        resultado = segundoN;
        firstOp = false;
      } else {
        if (lastOp == '+') {
          resultado += segundoN;
        } else if (lastOp == '-') {
          resultado -= segundoN;
        } else if (lastOp == '*') {
          resultado *= segundoN;
        } else if (lastOp == '/') {
          if (segundoN != 0) {
            resultado /= segundoN;
          } else {
            controle.text = 'Erro';
            return;
          }
        }
      }
    }
  }
}



