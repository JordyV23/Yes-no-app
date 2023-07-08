import 'package:flutter/material.dart';

class TheirMessageBubble extends StatelessWidget {
  const TheirMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Esta es otra prueba.',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _ImaggeBubble(),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImaggeBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //contexts hace referencia al arbol de widgets
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        "https://yesno.wtf/assets/no/20-56c4b19517aa69c8f7081939198341a4.gif",
        width: size.width * 0.7,
        height: 200,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text("GPTO está enviando una imagen"),
          );
        },
      ),
    );
  }
}
