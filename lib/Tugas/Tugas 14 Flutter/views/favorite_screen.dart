import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas/Tugas%2014%20Flutter/api/api_service.dart';
import 'package:flutter_application_1/Tugas/Tugas%2014%20Flutter/models/pokemon_models.dart';
import 'package:flutter_application_1/Tugas/Tugas%2014%20Flutter/views/pokemon_detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final ApiService _apiService = ApiService();
  List<FavoritePokemon> _favorites = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    setState(() => _isLoading = true);
    final favorites = await _apiService.getFavoritePokemon();
    if (!mounted) return;
    setState(() {
      _favorites = favorites;
      _isLoading = false;
    });
  }

  Future<void> _showManualDialog({FavoritePokemon? favorite}) async {
    final nameController = TextEditingController(text: favorite?.name ?? '');
    final typeController = TextEditingController(
      text: favorite?.typeLabel ?? '',
    );
    final imageController = TextEditingController(
      text: favorite?.imageUrl ?? '',
    );

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1A2238),
          title: Text(
            favorite == null ? 'Tambah Favorite Manual' : 'Update Favorite',
            style: const TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextField(
                  controller: nameController,
                  label: 'Nama Pokemon',
                ),
                const SizedBox(height: 12),
                _buildTextField(
                  controller: typeController,
                  label: 'Type / Category',
                ),
                const SizedBox(height: 12),
                _buildTextField(
                  controller: imageController,
                  label: 'Image URL (opsional)',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () async {
                final name = nameController.text.trim();
                final type = typeController.text.trim();
                final imageUrl = imageController.text.trim();

                if (name.isEmpty || type.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Nama dan type wajib diisi.'),
                    ),
                  );
                  return;
                }

                if (favorite == null) {
                  await _apiService.addManualFavoritePokemon(
                    name: name,
                    typeLabel: type,
                    imageUrl: imageUrl,
                  );
                } else {
                  await _apiService.updateFavoritePokemon(
                    favorite.copyWith(
                      name: name,
                      typeLabel: type,
                      imageUrl: imageUrl,
                    ),
                  );
                }

                if (!mounted) return;
                Navigator.pop(dialogContext);
                await _loadFavorites();
              },
              child: Text(favorite == null ? 'Simpan' : 'Update'),
            ),
          ],
        );
      },
    );

    nameController.dispose();
    typeController.dispose();
    imageController.dispose();
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withAlpha(80)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Future<void> _removeFavorite(String favoriteId) async {
    await _apiService.deleteFavoritePokemon(favoriteId);
    await _loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () => _showManualDialog(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Favorite Pokemon',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.redAccent),
                    )
                  : _favorites.isEmpty
                  ? const Center(
                      child: Text(
                        'Belum ada favorite.\nTambahkan dari detail atau manual.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 90),
                      itemCount: _favorites.length,
                      itemBuilder: (context, index) {
                        final favorite = _favorites[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A2238),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: Colors.white.withAlpha(24),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  color: Colors.white.withAlpha(16),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: favorite.imageUrl.isEmpty
                                    ? const Icon(
                                        Icons.catching_pokemon,
                                        color: Colors.white70,
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(14),
                                        child: Image.network(
                                          favorite.imageUrl,
                                          fit: BoxFit.cover,
                                          errorBuilder: (_, __, ___) {
                                            return const Icon(
                                              Icons.broken_image,
                                              color: Colors.white70,
                                            );
                                          },
                                        ),
                                      ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      favorite.name.toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      favorite.typeLabel,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      favorite.isManual
                                          ? 'Manual Favorite'
                                          : 'From Pokemon API',
                                      style: TextStyle(
                                        color: favorite.isManual
                                            ? Colors.amberAccent
                                            : Colors.lightBlueAccent,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuButton<String>(
                                color: const Color(0xFF1A2238),
                                iconColor: Colors.white,
                                onSelected: (value) async {
                                  if (value == 'edit') {
                                    await _showManualDialog(favorite: favorite);
                                  }

                                  if (value == 'open' &&
                                      favorite.pokemonUrl != null) {
                                    if (!mounted) return;
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PokemonDetailScreen(
                                          pokemonName: favorite.name,
                                          pokemonUrl: favorite.pokemonUrl!,
                                          accentColor: Colors.redAccent,
                                        ),
                                      ),
                                    );
                                    await _loadFavorites();
                                  }

                                  if (value == 'delete') {
                                    await _removeFavorite(favorite.favoriteId);
                                  }
                                },
                                itemBuilder: (context) {
                                  final items = <PopupMenuEntry<String>>[];
                                  if (favorite.isManual) {
                                    items.add(
                                      const PopupMenuItem<String>(
                                        value: 'edit',
                                        child: Text('Edit'),
                                      ),
                                    );
                                  }
                                  if (favorite.pokemonUrl != null) {
                                    items.add(
                                      const PopupMenuItem<String>(
                                        value: 'open',
                                        child: Text('Buka Detail'),
                                      ),
                                    );
                                  }
                                  items.add(
                                    const PopupMenuItem<String>(
                                      value: 'delete',
                                      child: Text('Hapus'),
                                    ),
                                  );
                                  return items;
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
