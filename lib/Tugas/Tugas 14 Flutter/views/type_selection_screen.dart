import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas/Tugas%2014%20Flutter/views/favorite_screen.dart';
import 'package:flutter_application_1/Tugas/Tugas%2014%20Flutter/views/pokemon_list_screen.dart';
import 'package:flutter_application_1/Tugas/Tugas%2014%20Flutter/widgets/type_card.dart';

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
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'What Are You\nLooking For?',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.3,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const FavoriteScreen(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Choose an element type and build your favorite Pokemon collection.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                        return TypeCard(
                          label: type['label'] as String,
                          icon: type['icon'] as IconData,
                          color: type['color'] as Color,
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
