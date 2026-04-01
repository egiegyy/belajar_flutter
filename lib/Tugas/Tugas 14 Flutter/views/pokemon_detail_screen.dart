import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas/Tugas%2014%20Flutter/api/api_service.dart';
import 'package:flutter_application_1/Tugas/Tugas%2014%20Flutter/models/pokemon_models.dart';

class PokemonDetailScreen extends StatefulWidget {
  final String pokemonName;
  final String pokemonUrl;
  final Color accentColor;
  final String? typeLabel;

  const PokemonDetailScreen({
    super.key,
    required this.pokemonName,
    required this.pokemonUrl,
    required this.accentColor,
    this.typeLabel,
  });

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  final ApiService _apiService = ApiService();
  bool _isLoading = true;
  String? _error;
  PokemonDetail? _detail;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadDetail();
  }

  Future<void> _loadDetail() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final result = await _apiService.getPokemonDetail(widget.pokemonUrl);
      if (!mounted) return;

      setState(() {
        _detail = result;
        _isLoading = false;
      });

      await _loadFavoriteStatus(result);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Failed to load detail.';
        _isLoading = false;
      });
    }
  }

  Future<void> _loadFavoriteStatus(PokemonDetail detail) async {
    final isFavorite = await _apiService.isFavorite('pokemon-${detail.id}');
    if (!mounted) return;
    setState(() => _isFavorite = isFavorite);
  }

  Future<void> _toggleFavorite() async {
    final detail = _detail;
    if (detail == null) return;

    final favoriteId = 'pokemon-${detail.id}';

    if (_isFavorite) {
      await _apiService.deleteFavoritePokemon(favoriteId);
      if (!mounted) return;
      setState(() => _isFavorite = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pokemon dihapus dari favorite.')),
      );
      return;
    }

    final favorite = FavoritePokemon(
      favoriteId: favoriteId,
      name: detail.name,
      typeLabel: widget.typeLabel ?? detail.types.join(', '),
      imageUrl: detail.imageUrl,
      pokemonUrl: widget.pokemonUrl,
      isManual: false,
    );

    await _apiService.putFavoritePokemon(favorite);
    if (!mounted) return;
    setState(() => _isFavorite = true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pokemon ditambahkan ke favorite.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(color: widget.accentColor),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_error!, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _loadDetail, child: const Text('Retry')),
          ],
        ),
      );
    }

    final data = _detail!;

    return Stack(
      children: [
        Positioned(
          top: -120,
          right: -80,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.accentColor.withAlpha(51),
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      Text(
                        data.name.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8,
                        runSpacing: 8,
                        children: data.types
                            .map(
                              (type) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: widget.accentColor.withAlpha(60),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: widget.accentColor.withAlpha(140),
                                  ),
                                ),
                                child: Text(
                                  type.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 10),
                      Hero(
                        tag: 'pokemon-${data.id}',
                        child: Image.network(
                          data.imageUrl,
                          height: 200,
                          errorBuilder: (_, __, ___) {
                            return const Icon(
                              Icons.broken_image,
                              color: Colors.white70,
                              size: 100,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 22),
                      _InfoCard(
                        title: 'Height',
                        value: data.height.toString(),
                        color: widget.accentColor,
                      ),
                      _InfoCard(
                        title: 'Weight',
                        value: data.weight.toString(),
                        color: widget.accentColor,
                      ),
                      _InfoCard(
                        title: 'Types',
                        value: data.types.join(', '),
                        color: widget.accentColor,
                      ),
                      _InfoCard(
                        title: 'Abilities',
                        value: data.abilities.join(', '),
                        color: widget.accentColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          const Spacer(),
          GestureDetector(
            onTap: _toggleFavorite,
            child: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: widget.accentColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _InfoCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2238),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withAlpha(140)),
        boxShadow: [
          BoxShadow(
            color: color.withAlpha(35),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.white, fontSize: 15),
          children: [
            TextSpan(
              text: '$title: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
