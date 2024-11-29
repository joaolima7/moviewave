import 'package:flutter/material.dart';
import '../../domain/entities/category_entity.dart';

class CategoryCard extends StatelessWidget {
  final CategoryEntity category;
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
        height: 180,
        width: 160,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.white10,
              Colors.grey.shade600,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -20,
              left: -35,
              child: Image.asset(
                category.imagePath,
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 20,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    category.subtitle,
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
