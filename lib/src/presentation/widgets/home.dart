import 'package:flutter/material.dart';
import 'package:movie_app/src/domain/entities/category_entity.dart';
import 'package:movie_app/src/domain/entities/movie_entity.dart';
import 'package:movie_app/src/presentation/components/category_card.dart';
import 'package:movie_app/src/presentation/components/movie_card.dart';

import '../components/text_field_cutom.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController ctrl = TextEditingController();

    // Lista de filmes para "Most searched"
    final movies = [
      MovieEntity(
        id: 1,
        title: 'Secret Wars',
        originalTitle: 'Secret Wars',
        overview: 'A great battle between heroes.',
        posterPath: '/secret_wars.jpg', // Substitua pelo caminho real
        backdropPath: '/backdrop.jpg',
        mediaType: 'movie',
        adult: false,
        originalLanguage: 'en',
        genreIds: [28, 12],
        popularity: 8.5,
        releaseDate: '2022-11-25',
        video: false,
        voteAverage: 7.8,
        voteCount: 340,
      ),
      MovieEntity(
        id: 2,
        title: 'Samaritan',
        originalTitle: 'Samaritan',
        overview: 'A retired superhero returns.',
        posterPath: '/samaritan.jpg',
        backdropPath: '/backdrop.jpg',
        mediaType: 'movie',
        adult: false,
        originalLanguage: 'en',
        genreIds: [28, 18],
        popularity: 9.2,
        releaseDate: '2022-10-10',
        video: false,
        voteAverage: 7.3,
        voteCount: 420,
      ),
      // Adicione mais objetos Movie conforme necessário
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pesquisa
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Pesquisa',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldCustom(
            controller: ctrl,
            hintText: 'Procure um conteúdo.',
          ),

          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 20, left: 10),
            child: Text(
              'Categorias',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(15, 17, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CategoryCard(
                  category: CategoryEntity(
                      title: 'Filmes',
                      subtitle: '',
                      imagePath: 'assets/images/goku.png'),
                  onTap: () {},
                ),
                const SizedBox(
                  width: 25,
                ),
                CategoryCard(
                  category: CategoryEntity(
                      title: 'Animes',
                      subtitle: '',
                      imagePath: 'assets/images/goku.png'),
                  onTap: () {},
                ),
                const SizedBox(
                  width: 25,
                ),
                CategoryCard(
                  category: CategoryEntity(
                      title: 'Desenhos',
                      subtitle: '',
                      imagePath: 'assets/images/goku.png'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Most searched
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Mais procurados',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 15),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: MovieCard(
                    movie: movie,
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Ver mais',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
