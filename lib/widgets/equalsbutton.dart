import 'dart:ui';

import 'package:calculadora/pages/homepage.dart';
import 'package:calculadora/functions/history.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class EqualsButton extends StatefulWidget {
  final String button;
  final Color color;
  const EqualsButton({super.key, required this.button, required this.color});

  @override
  State<EqualsButton> createState() => _EqualsButtonState();
}

class _EqualsButtonState extends State<EqualsButton> {
  @override
  Widget build(BuildContext context) {
    Parser p = Parser();
    ContextModel cm = ContextModel();
    String textbutton = widget.button;
    HomePageState homepagestate =
        context.findAncestorStateOfType<HomePageState>()!;
    Historico historico = homepagestate.historico;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: 60,
        width: 60,
        child: IconButton(
          onPressed: () {
            setState(() {
              if (textbutton == '=' &&
                  homepagestate.numeroDigito.join() != '') {
                //tenta calcular a String
                try {
                  //converte e calcula a expressão em String para um double
                  Expression exp = p.parse(homepagestate.numeroDigito.join());
                  double resultado = exp.evaluate(EvaluationType.REAL, cm);
                  //limpa o texto da tela
                  homepagestate.clearText();
                  //adiciona um "=" no historico
                  historico.concatStrings(" = ");
                  //mostra o resultado na tela
                  homepagestate.editNumeroText(resultado.toString());
                  //passa a String _historico para uma lista
                  historico.historicosToList(historico.getHistorico());
                  textbutton = '';
                } catch (error) {
                  homepagestate.clearText();
                }
              }
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Borda circular
            ),
            // Cor de fundo vermelho
          ),
          icon: Text(
            textbutton,
            style: TextStyle(
                fontSize: 30.0,
                color: widget.color,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
