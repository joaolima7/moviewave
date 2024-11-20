import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _imageSlideAnimation;
  late Animation<double> _textSlideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _imageSlideAnimation = Tween<double>(begin: 100, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _textSlideAnimation = Tween<double>(begin: 50, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Column(
              children: [
                // Imagens empilhadas na parte superior
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      // Primeira imagem
                      Positioned(
                        top: _imageSlideAnimation.value,
                        left: 0,
                        right: 0,
                        child: Opacity(
                          opacity: _fadeAnimation.value,
                          child: ClipPath(
                            clipper: DiagonalClipper(),
                            child: Image.asset(
                              'assets/images/morbius.jpeg',
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height * 0.30,
                            ),
                          ),
                        ),
                      ),
                      // Segunda imagem
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.22 +
                            _imageSlideAnimation.value,
                        left: 0,
                        right: 0,
                        child: Opacity(
                          opacity: _fadeAnimation.value,
                          child: ClipPath(
                            clipper: DiagonalClipper(),
                            child: Image.asset(
                              'assets/images/stranger_things.jpeg',
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height * 0.30,
                            ),
                          ),
                        ),
                      ),
                      // Terceira imagem
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.44 +
                            _imageSlideAnimation.value,
                        left: 0,
                        right: 0,
                        child: Opacity(
                          opacity: _fadeAnimation.value,
                          child: ClipPath(
                            clipper: DiagonalClipper(),
                            child: Image.asset(
                              'assets/images/demon_slayer.jpeg',
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height * 0.30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Textos de Onboarding
                Expanded(
                  flex: 1,
                  child: Transform.translate(
                    offset: Offset(0, _textSlideAnimation.value),
                    child: Opacity(
                      opacity: _fadeAnimation.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'MovieWave',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Filmes, séries, animes em um só lugar!',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 24),
                          GestureDetector(
                            onTap: () {
                              context.push('/home');
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF21D4FD),
                                    Color(0xFF9C27B0),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 60,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.85),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Text(
                                  'Começar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 80); // Linha inclinada da esquerda inferior
    path.lineTo(size.width, size.height); // Linha para o canto inferior direito
    path.lineTo(size.width, 80); // Linha inclinada da direita superior
    path.lineTo(0, 0); // Linha para o canto superior esquerdo
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
