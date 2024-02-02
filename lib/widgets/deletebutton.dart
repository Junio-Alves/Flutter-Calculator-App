import 'package:calculadora/pages/homepage.dart';
import 'package:flutter/material.dart';

class DeleteButton extends StatefulWidget {
  const DeleteButton({super.key});

  @override
  State<DeleteButton> createState() => _BuildButtonState();
}

class _BuildButtonState extends State<DeleteButton> {
  @override
  Widget build(BuildContext context) {
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
                if (homepagestate.numeroDigito.join() != '') {
                  homepagestate.deleteLastDigit();
                }
              });
              //função de limpar o texto
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent, // Cor de fundo vermelho
            ),
            icon: const Icon(
              Icons.backspace,
              color: Colors.white,
            )),
      ),
    );
  }
}
