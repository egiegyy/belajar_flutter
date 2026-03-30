import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas/Tugas%2014%20Flutter/api/api_service.dart';
import 'package:flutter_application_1/Tugas/Tugas%2014%20Flutter/models/pokemon_models.dart';
import 'package:flutter_application_1/Tugas/Tugas%2014%20Flutter/views/pokemon_detail_screen.dart';

class PokemonListScreen extends StatefulWidget {
  final String typeLabel;
  final String typeName;
  final Color typeColor;

  const PokemonListScreen({
    super.key,
    required this.typeLabel,
    required this.typeName,
    required this.typeColor,
  });

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  final ApiService _apiService = ApiService();
  bool _isLoading = true;
  bool _showContent = false;
  String? _error;
  List<PokemonItem> _pokemon = [];

  @override
  void initState() {
    super.initState();
    _loadPokemon();
  }

  Future<void> _loadPokemon() async {
    try {
      setState(() {
        _isLoading = true;
        _showContent = false;
        _error = null;
      });

      // Only base form, no evolutions, max 20.
      final result = await _apiService.getBasePokemonByType(widget.typeName);

      if (!mounted) return;

      setState(() {
        _pokemon = result;
        _isLoading = false;
      });

      await Future<void>.delayed(const Duration(milliseconds: 100));
      if (!mounted) return;
      setState(() => _showContent = true);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Failed to load Pokemon list.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              const Spacer(),
              Icon(Icons.catching_pokemon, color: widget.typeColor),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            '${widget.typeLabel} Pokemon',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator(color: widget.typeColor));
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_error!, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _loadPokemon, child: const Text('Retry')),
          ],
        ),
      );
    }

    if (_pokemon.isEmpty) {
      return const Center(
        child: Text(
          'No base form Pokemon found for this type.',
          style: TextStyle(color: Colors.white70),
        ),
      );
    }

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 350),
      opacity: _showContent ? 1 : 0,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: _pokemon.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.88,
        ),
        itemBuilder: (context, index) {
          final pokemon = _pokemon[index];
          return _PokemonCard(
            pokemon: pokemon,
            color: widget.typeColor,
            typeLabel: widget.typeLabel,
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 320),
                  pageBuilder: (_, __, ___) => PokemonDetailScreen(
                    pokemonName: pokemon.name,
                    pokemonUrl: pokemon.url,
                    accentColor: widget.typeColor,
                  ),
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _PokemonCard extends StatefulWidget {
  final PokemonItem pokemon;
  final Color color;
  final String typeLabel;
  final VoidCallback onTap;

  const _PokemonCard({
    required this.pokemon,
    required this.color,
    required this.typeLabel,
    required this.onTap,
  });

  @override
  State<_PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<_PokemonCard> {
  double _scale = 1;

  void _onTapDown(TapDownDetails details) {
    setState(() => _scale = 0.96);
  }

  void _onTapCancel() {
    setState(() => _scale = 1);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _scale = 1);
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapCancel: _onTapCancel,
      onTapUp: _onTapUp,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 120),
        scale: _scale,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
              colors: [
                widget.color.withAlpha(230),
                widget.color.withAlpha(153),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.color.withAlpha(102),
                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                right: -18,
                bottom: -18,
                child: Icon(
                  Icons.catching_pokemon,
                  size: 105,
                  color: Colors.white.withAlpha(38),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(56),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        widget.typeLabel,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Hero(
                        tag: 'pokemon-${widget.pokemon.id}',
                        child: Image.network(
                          widget.pokemon.imageUrl,
                          height: 100,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) {
                            return const Icon(
                              Icons.broken_image,
                              color: Colors.white,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.pokemon.name.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Tap to view details',
                      style: TextStyle(color: Colors.white70, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
