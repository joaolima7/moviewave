import 'package:flutter/material.dart';
import '../../domain/entities/category_entity.dart';

class CategoryCard extends StatelessWidget {
  final CategoryEntity category; // Aceita uma instância de CategoryEntity
  final VoidCallback onTap;

  const CategoryCard({
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180, // Altura do card
        width: 160, // Largura do card
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.white10,
              Colors.grey.shade600,
            ],
          ), // Gradiente da categoria
          borderRadius: BorderRadius.circular(20), // Cantos arredondados
        ),
        child: Stack(
          clipBehavior:
              Clip.none, // Para permitir que a imagem saia do container
          children: [
            // Imagem posicionada
            Positioned(
              top: -20, // Faz a imagem sair do card
              left: -35, // Ajusta horizontalmente
              child: Image.asset(
                category.imagePath, // Imagem da categoria
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
            // Títulos (alinhados no canto esquerdo inferior)
            Positioned(
              bottom: 20,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.title, // Título da categoria
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    category.subtitle, // Subtítulo da categoria
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
