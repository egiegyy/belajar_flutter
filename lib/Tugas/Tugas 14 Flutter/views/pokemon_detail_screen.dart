import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas/Tugas%2014%20Flutter/api/api_service.dart';
import 'package:flutter_application_1/Tugas/Tugas%2014%20Flutter/models/pokemon_models.dart';

class PokemonDetailScreen extends StatefulWidget {
  final String pokemonName;
  final String pokemonUrl;
  final Color accentColor;

  const PokemonDetailScreen({
    super.key,
    required this.pokemonName,
    required this.pokemonUrl,
    required this.accentColor,
  });

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  final ApiService _apiService = ApiService();
  bool _isLoading = true;
  String? _error;
  PokemonDetail? _detail;

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
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Failed to load detail.';
        _isLoading = false;
      });
    }
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
                      Hero(
                        tag: 'pokemon-${data.id}',
                        child: Image.network(data.imageUrl, height: 200),
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
          Icon(Icons.favorite_border, color: widget.accentColor),
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2238),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlpha(140)),
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
