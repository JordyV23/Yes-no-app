import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class TheirMessageBubble extends StatelessWidget {

  const TheirMessageBubble({super.key, required this.mensaje});
  final Message mensaje;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              mensaje.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _ImaggeBubble(imageUrl: mensaje.imageUrl!,),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImaggeBubble extends StatelessWidget {
  final String imageUrl;

  const _ImaggeBubble({required this.imageUrl});


  @override
  Widget build(BuildContext context) {
    //contexts hace referencia al arbol de widgets
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
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
