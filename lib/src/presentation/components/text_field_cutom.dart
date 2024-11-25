import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  TextFieldCustom({
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF21D4FD),
            Color(0xFF9C27B0),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.all(2), // Espaço para o gradiente
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black, // Cor de fundo do TextField
          borderRadius: BorderRadius.circular(23),
        ),
        child: TextFormField(
          controller: controller,
          style: const TextStyle(color: Colors.white), // Texto branco
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey), // Estilo do placeholder
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            border: InputBorder.none, // Remove a borda padrão
          ),
        ),
      ),
    );
  }
}
