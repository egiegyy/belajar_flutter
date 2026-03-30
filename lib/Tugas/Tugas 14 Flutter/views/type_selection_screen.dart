import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas/Tugas%2014%20Flutter/views/pokemon_list_screen.dart';

class TypeSelectionScreen extends StatelessWidget {
  const TypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final types = <Map<String, dynamic>>[
      {
        'label': 'Water',
        'type': 'water',
        'icon': Icons.water_drop,
        'color': const Color(0xFF4FC3F7),
      },
      {
        'label': 'Fire',
        'type': 'fire',
        'icon': Icons.local_fire_department,
        'color': const Color(0xFFFF7043),
      },
      {
        'label': 'Grass',
        'type': 'grass',
        'icon': Icons.eco,
        'color': const Color(0xFF66BB6A),
      },
      {
        'label': 'Electric',
        'type': 'electric',
        'icon': Icons.bolt,
        'color': const Color(0xFFFFD54F),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      body: Stack(
        children: [
          //FIRE
          Positioned(
            top: -100,
            left: -80,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withAlpha(38),
              ),
            ),
          ),
          Positioned(
            bottom: -120,
            right: -80,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple.withAlpha(30),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //BACKGROUND DECORATIONS
                  const SizedBox(height: 20),
                  const Text(
                    'What Are You\nLooking For?',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 20),
                  //FIRE GRID
                  Expanded(
                    child: GridView.builder(
                      itemCount: types.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 1,
                          ),
                      itemBuilder: (context, index) {
                        final type = types[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: const Duration(
                                  milliseconds: 350,
                                ),
                                pageBuilder: (_, __, ___) => PokemonListScreen(
                                  typeLabel: type['label'] as String,
                                  typeName: type['type'] as String,
                                  typeColor: type['color'] as Color,
                                ),
                                transitionsBuilder: (_, animation, __, child) {
                                  final offsetAnimation = Tween<Offset>(
                                    begin: const Offset(0.12, 0),
                                    end: Offset.zero,
                                  ).animate(animation);

                                  return SlideTransition(
                                    position: offsetAnimation,
                                    child: FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              gradient: LinearGradient(
                                colors: [
                                  (type['color'] as Color).withAlpha(230),
                                  (type['color'] as Color).withAlpha(153),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: (type['color'] as Color).withAlpha(
                                    102,
                                  ),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: -20,
                                  bottom: -20,
                                  child: Icon(
                                    type['icon'] as IconData,
                                    size: 100,
                                    color: Colors.white.withAlpha(38),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        type['icon'] as IconData,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                      const Spacer(),
                                      Text(
                                        type['label'] as String,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
