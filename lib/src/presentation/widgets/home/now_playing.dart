import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:movie_app/src/presentation/controllers/home_controllers/now_playing_controller.dart';

import '../../components/movie_card.dart';

class NowPlaying extends StatelessWidget {
  NowPlaying({super.key});
  final controller = GetIt.I.get<NowPlayingController>();

  @override
  Widget build(BuildContext context) {
    controller.load();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'No cinema',
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
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }

              if (controller.moviesNowPlaying.isEmpty) {
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
                itemCount:
                    controller.moviesNowPlaying.length + 1, // +1 para o botão
                itemBuilder: (context, index) {
                  if (index == controller.moviesNowPlaying.length) {
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
                  final movie = controller.moviesNowPlaying[index];
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
    );
  }
}
