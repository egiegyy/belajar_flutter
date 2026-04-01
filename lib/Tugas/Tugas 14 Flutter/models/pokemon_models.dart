class PokemonItem {
  final String name;
  final String url;

  PokemonItem({
    required this.name,
    required this.url,
  });

  factory PokemonItem.fromTypeJson(Map<String, dynamic> json) {
    final pokemon = json['pokemon'] as Map<String, dynamic>;
    return PokemonItem(
      name: pokemon['name'] as String,
      url: pokemon['url'] as String,
    );
  }

  // Example URL: https://pokeapi.co/api/v2/pokemon/25/
  // We split by "/" and get the number before the last slash.
  int get id {
    final pieces = url.split('/');
    return int.parse(pieces[pieces.length - 2]);
  }

  String get imageUrl {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }
}

class EvolutionGroup {
  final String chainId;
  final List<PokemonItem> members;

  EvolutionGroup({
    required this.chainId,
    required this.members,
  });
}

class PokemonDetail {
  final int id;
  final String name;
  final int height;
  final int weight;
  final List<String> abilities;
  final List<String> types;

  PokemonDetail({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.types,
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    return PokemonDetail(
      id: json['id'] as int,
      name: json['name'] as String,
      height: json['height'] as int,
      weight: json['weight'] as int,
      abilities: (json['abilities'] as List)
          .map((item) => item['ability']['name'] as String)
          .toList(),
      types: (json['types'] as List)
          .map((item) => item['type']['name'] as String)
          .toList(),
    );
  }

  String get imageUrl {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }
}

class FavoritePokemon {
  final String favoriteId;
  final String name;
  final String typeLabel;
  final String imageUrl;
  final String? pokemonUrl;
  final bool isManual;

  FavoritePokemon({
    required this.favoriteId,
    required this.name,
    required this.typeLabel,
    required this.imageUrl,
    this.pokemonUrl,
    required this.isManual,
  });

  factory FavoritePokemon.fromMap(Map<String, dynamic> map) {
    return FavoritePokemon(
      favoriteId: map['favoriteId'] as String,
      name: map['name'] as String,
      typeLabel: map['typeLabel'] as String? ?? 'Unknown',
      imageUrl: map['imageUrl'] as String? ?? '',
      pokemonUrl: map['pokemonUrl'] as String?,
      isManual: map['isManual'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'favoriteId': favoriteId,
      'name': name,
      'typeLabel': typeLabel,
      'imageUrl': imageUrl,
      'pokemonUrl': pokemonUrl,
      'isManual': isManual,
    };
  }

  FavoritePokemon copyWith({
    String? favoriteId,
    String? name,
    String? typeLabel,
    String? imageUrl,
    String? pokemonUrl,
    bool? isManual,
  }) {
    return FavoritePokemon(
      favoriteId: favoriteId ?? this.favoriteId,
      name: name ?? this.name,
      typeLabel: typeLabel ?? this.typeLabel,
      imageUrl: imageUrl ?? this.imageUrl,
      pokemonUrl: pokemonUrl ?? this.pokemonUrl,
      isManual: isManual ?? this.isManual,
    );
  }
}
