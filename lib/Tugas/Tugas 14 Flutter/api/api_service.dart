import 'dart:convert';
import 'package:flutter_application_1/Tugas/Tugas%2014%20Flutter/models/pokemon_models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String _baseUrl = 'https://pokeapi.co/api/v2';
  static const String _favoriteStorageKey = 'pokemon_favorites';

  Future<List<PokemonItem>> getPokemonByType(String type) async {
    final uri = Uri.parse('$_baseUrl/type/$type');
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load Pokemon list');
    }

    final data = json.decode(response.body) as Map<String, dynamic>;
    final pokemonList = data['pokemon'] as List;

    return pokemonList
        .map((item) => PokemonItem.fromTypeJson(item as Map<String, dynamic>))
        .toList();
  }

  // Get 20 Pokemon max, only base/non-evolution forms.
  Future<List<PokemonItem>> getBasePokemonByType(String type) async {
    final allPokemon = await getPokemonByType(type);
    final result = <PokemonItem>[];
    final usedChains = <String>{};

    for (final pokemon in allPokemon) {
      final speciesData = await _getSpeciesDataFromPokemonUrl(pokemon.url);
      final evolvesFrom = speciesData['evolves_from_species'];

      final chainUrl =
          (speciesData['evolution_chain'] as Map<String, dynamic>)['url']
              as String;
      final chainId = _extractIdFromUrl(chainUrl).toString();

      // Keep only base form and avoid duplicate chain.
      if (evolvesFrom == null && !usedChains.contains(chainId)) {
        result.add(pokemon);
        usedChains.add(chainId);
      }

      if (result.length == 20) break;
    }

    return result;
  }

  Future<Map<String, dynamic>> _getSpeciesDataFromPokemonUrl(
    String pokemonUrl,
  ) async {
    final pokemonId = _extractIdFromUrl(pokemonUrl);
    final speciesUri = Uri.parse('$_baseUrl/pokemon-species/$pokemonId');
    final response = await http.get(speciesUri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load species data');
    }

    return json.decode(response.body) as Map<String, dynamic>;
  }

  Future<List<EvolutionGroup>> getEvolutionGroups(
    List<PokemonItem> pokemonList,
  ) async {
    final Map<String, List<PokemonItem>> grouped = {};

    // We only process list data that already has max 20 items.
    for (final pokemon in pokemonList) {
      final chainId = await getEvolutionChainIdFromPokemonUrl(pokemon.url);
      grouped.putIfAbsent(chainId, () => []);
      grouped[chainId]!.add(pokemon);
    }

    final groups = grouped.entries.map((entry) {
      // Sort by Pokemon id so evolution order is usually correct.
      entry.value.sort((a, b) => a.id.compareTo(b.id));
      return EvolutionGroup(chainId: entry.key, members: entry.value);
    }).toList();

    // Keep groups stable for nicer UI order.
    groups.sort((a, b) => a.members.first.id.compareTo(b.members.first.id));
    return groups;
  }

  Future<String> getEvolutionChainIdFromPokemonUrl(String pokemonUrl) async {
    final data = await _getSpeciesDataFromPokemonUrl(pokemonUrl);
    final chainUrl = data['evolution_chain']['url'] as String;
    return _extractIdFromUrl(chainUrl).toString();
  }

  int _extractIdFromUrl(String url) {
    final pieces = url.split('/');
    return int.parse(pieces[pieces.length - 2]);
  }

  Future<PokemonDetail> getPokemonDetail(String url) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load Pokemon detail');
    }

    final data = json.decode(response.body) as Map<String, dynamic>;
    return PokemonDetail.fromJson(data);
  }

  Future<List<FavoritePokemon>> getFavoritePokemon() async {
    final prefs = await SharedPreferences.getInstance();
    final rawList = prefs.getStringList(_favoriteStorageKey) ?? [];

    return rawList
        .map((item) => FavoritePokemon.fromMap(json.decode(item)))
        .toList();
  }

  Future<void> putFavoritePokemon(FavoritePokemon favorite) async {
    final favorites = await getFavoritePokemon();
    final index = favorites.indexWhere(
      (item) => item.favoriteId == favorite.favoriteId,
    );

    if (index >= 0) {
      favorites[index] = favorite;
    } else {
      favorites.add(favorite);
    }

    await _saveFavorites(favorites);
  }

  Future<void> updateFavoritePokemon(FavoritePokemon favorite) async {
    final favorites = await getFavoritePokemon();
    final index = favorites.indexWhere(
      (item) => item.favoriteId == favorite.favoriteId,
    );

    if (index < 0) {
      throw Exception('Favorite Pokemon tidak ditemukan.');
    }

    favorites[index] = favorite;
    await _saveFavorites(favorites);
  }

  Future<void> addManualFavoritePokemon({
    required String name,
    required String typeLabel,
    String imageUrl = '',
  }) async {
    final favorite = FavoritePokemon(
      favoriteId: 'manual-${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      typeLabel: typeLabel,
      imageUrl: imageUrl,
      isManual: true,
    );

    await putFavoritePokemon(favorite);
  }

  Future<void> deleteFavoritePokemon(String favoriteId) async {
    final favorites = await getFavoritePokemon();
    favorites.removeWhere((item) => item.favoriteId == favoriteId);
    await _saveFavorites(favorites);
  }

  Future<bool> isFavorite(String favoriteId) async {
    final favorites = await getFavoritePokemon();
    return favorites.any((item) => item.favoriteId == favoriteId);
  }

  Future<void> _saveFavorites(List<FavoritePokemon> favorites) async {
    final prefs = await SharedPreferences.getInstance();
    final rawList = favorites.map((item) => json.encode(item.toMap())).toList();
    await prefs.setStringList(_favoriteStorageKey, rawList);
  }
}
