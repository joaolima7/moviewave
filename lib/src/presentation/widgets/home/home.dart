import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:movie_app/src/domain/entities/category_entity.dart';
import 'package:movie_app/src/presentation/components/category_card.dart';
import 'package:movie_app/src/presentation/components/movie_card.dart';
import 'package:movie_app/src/presentation/components/text_field_cutom.dart';
import 'package:movie_app/src/presentation/controllers/home_controllers/movies_popular_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final moviesPopularController = GetIt.I.get<MoviesPopularController>();

  @override
  void initState() {
    super.initState();
    moviesPopularController.load();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController ctrl = TextEditingController();

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
            child: Obx(
              () {
                if (moviesPopularController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }

                if (moviesPopularController.moviesPopular.isEmpty) {
                  return const Center(
                    child: Text(
                      'Nenhum filme encontrado!',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 15),
                  itemCount: moviesPopularController.moviesPopular.length +
                      1, // +1 para o botão
                  itemBuilder: (context, index) {
                    if (index == moviesPopularController.moviesPopular.length) {
                      return Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: const LineIcon(
                            LineIcons.plus,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }

                    // Renderizar um filme normalmente
                    final movie = moviesPopularController.moviesPopular[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: MovieCard(
                        movie: movie,
                        onTap: () {},
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
