import 'package:flutter/material.dart';
import 'package:movie_app/src/domain/entities/movie_entity.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movie;
  final VoidCallback onTap;

  const MovieCard({
    required this.movie,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pôster do filme
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${movie.posterPath}', // URL base da API do TMDB
              width: 120, // Largura do card
              height: 160, // Altura do card
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 120,
                height: 160,
                color: Colors.grey, // Placeholder se a imagem não carregar
                child: const Icon(Icons.broken_image, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Título do filme
          SizedBox(
            width: 120, // Mesma largura que o pôster
            child: Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Ano de lançamento
          Text(
            movie.releaseDate.isNotEmpty
                ? movie.releaseDate.split('-')[0] // Exibe apenas o ano
                : 'Unknown',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
