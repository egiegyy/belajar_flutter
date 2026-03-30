import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas/Tugas%2014%20Flutter/models/pokemon_models.dart';

class PokemonGridItem extends StatefulWidget {
  final EvolutionGroup group;
  final Color glowColor;
  final void Function(PokemonItem selectedPokemon) onTap;

  const PokemonGridItem({
    super.key,
    required this.group,
    required this.glowColor,
    required this.onTap,
  });

  @override
  State<PokemonGridItem> createState() => _PokemonGridItemState();
}

class _PokemonGridItemState extends State<PokemonGridItem> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() => _scale = 0.97);
  }

  void _onTapCancel() {
    setState(() => _scale = 1.0);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _scale = 1.0);
    // Open detail from the first evolution form.
    widget.onTap(widget.group.members.first);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 120),
        scale: _scale,
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF1B2A49), Color(0xFF101B34)],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: widget.glowColor.withOpacity(0.6)),
              boxShadow: [
                BoxShadow(
                  color: widget.glowColor.withOpacity(0.25),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.auto_awesome, color: widget.glowColor, size: 16),
                      const SizedBox(width: 6),
                      Text(
                        'Evolution Chain',
                        style: TextStyle(
                          color: widget.glowColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                          letterSpacing: 0.6,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: widget.glowColor.withOpacity(0.16),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${widget.group.members.length}',
                          style: TextStyle(
                            color: widget.glowColor,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.group.members.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      itemBuilder: (context, index) {
                        final pokemon = widget.group.members[index];
                        return GestureDetector(
                          onTap: () => widget.onTap(pokemon),
                          child: SizedBox(
                            width: 84,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Hero(
                                    tag: 'pokemon-${pokemon.id}',
                                    child: Image.network(
                                      pokemon.imageUrl,
                                      fit: BoxFit.contain,
                                      loadingBuilder:
                                          (context, child, progress) {
                                            if (progress == null) return child;
                                            return const Center(
                                              child: SizedBox(
                                                width: 20,
                                                height: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                    ),
                                              ),
                                            );
                                          },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return const Icon(
                                              Icons.broken_image,
                                              size: 30,
                                              color: Colors.white70,
                                            );
                                          },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  pokemon.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
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
        ),
      ),
    );
  }
}
