import 'package:calculadora/pages/homepage.dart';
import 'package:flutter/material.dart';

class BuildButton extends StatefulWidget {
  final String button;
  final Color color;
  const BuildButton({super.key, required this.button, required this.color});

  @override
  State<BuildButton> createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  @override
  Widget build(BuildContext context) {
    String textbutton = widget.button;
    HomePageState homepagestate =
        context.findAncestorStateOfType<HomePageState>()!;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: 60,
        width: 60,
        child: IconButton(
          onPressed: () {
            setState(() {
              if (textbutton == 'C') {
                homepagestate.clearText();
                textbutton = '';
                homepagestate.historico.clearHistorico();
                //se o botão pressionado não for "C" nem "="
              } else if (textbutton != "C" && textbutton != "=") {
                homepagestate.editNumeroText(textbutton);
              }
            });
            //função de limpar o texto
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, // Cor de fundo vermelho
          ),
          icon: Text(
            widget.button,
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
