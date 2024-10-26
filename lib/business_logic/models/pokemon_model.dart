// To parse this JSON data, do
//
//     final pokeManModel = pokeManModelFromJson(jsonString);

import 'package:equatable/equatable.dart';

// PokeManDataModel pokeManModelFromJson(String str) =>
//     PokeManDataModel.fromJson(json.decode(str));
//
// String pokeManModelToJson(PokeManDataModel data) => json.encode(data.toJson());
//
// class PokeManDataModel extends Equatable {
//   final List<PokeManModel> data;
//   final int page;
//   final int pageSize;
//   final int count;
//   final int totalCount;
//
//   PokeManDataModel({
//     required this.data,
//     required this.page,
//     required this.pageSize,
//     required this.count,
//     required this.totalCount,
//   });
//
//   factory PokeManDataModel.fromJson(Map<String, dynamic> json) =>
//       PokeManDataModel(
//         data: List<PokeManModel>.from(
//             json["data"].map((x) => PokeManModel.fromJson(x))),
//         page: json["page"],
//         pageSize: json["pageSize"],
//         count: json["count"],
//         totalCount: json["totalCount"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "page": page,
//         "pageSize": pageSize,
//         "count": count,
//         "totalCount": totalCount,
//       };
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }

class PokemonModel extends Equatable {
  final String id;
  final String name;
  final String? supertype;
  final List<String> subtypes;
  final String? level;
  final String? hp;
  final List<String>? types;
  final String? evolvesFrom;
  final List<Ability>? abilities;
  final List<Attack>? attacks;
  final List<Weakness>? weaknesses;
  final List<Weakness>? resistances;
  final List<String>? retreatCost;
  final int? convertedRetreatCost;
  final Set? datumSet;
  final String? number;
  final String artist;
  final String? rarity;
  final String? flavorText;
  final List<int>? nationalPokedexNumbers;
  final Legalities? legalities;
  final DatumImages? images;
  final Tcgplayer? tcgplayer;
  final Cardmarket? cardmarket;
  final List<String>? evolvesTo;
  final List<String>? rules;

  PokemonModel({
    required this.id,
    required this.name,
    required this.supertype,
    required this.subtypes,
    this.level,
    this.hp,
    required this.types,
    this.evolvesFrom,
    this.abilities,
    required this.attacks,
    required this.weaknesses,
    this.resistances,
    this.retreatCost,
    this.convertedRetreatCost,
    this.datumSet,
    this.number,
    required this.artist,
    this.rarity,
    this.flavorText,
    this.nationalPokedexNumbers,
    this.legalities,
    this.images,
    this.tcgplayer,
    this.cardmarket,
    this.evolvesTo,
    this.rules,
  });

  // factory PokeMonModel.initial() {
  //   return [];
  //     // PokeMonModel(
  //     //   id: '',
  //     //   name: '',
  //     //   supertype: null,
  //     //   subtypes: [],
  //     //   hp: '',
  //     //   types: [],
  //     //   attacks: [],
  //     //   weaknesses: [],
  //     //   datumSet: null,
  //     //   number: '',
  //     //   artist: '');
  // }

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        id: json["id"],
        name: json["name"],
        supertype: json["supertype"]!,
        subtypes: List<String>.from(json["subtypes"].map((x) => x)),
        level: json["level"],
        hp: json["hp"],
        types: List<String>.from(json["types"].map((x) => x!.toString())),
        evolvesFrom: json["evolvesFrom"],
        abilities: json["abilities"] == null
            ? []
            : List<Ability>.from(
                json["abilities"]!.map((x) => Ability.fromJson(x))),
        attacks:
            List<Attack>.from(json["attacks"].map((x) => Attack.fromJson(x))),
        weaknesses: List<Weakness>.from(
            json["weaknesses"].map((x) => Weakness.fromJson(x))),
        resistances: json["resistances"] == null
            ? []
            : List<Weakness>.from(
                json["resistances"]!.map((x) => Weakness.fromJson(x))),
        retreatCost: json["retreatCost"] == null
            ? []
            : List<String>.from(json["retreatCost"]!.map((x) => x!)),
        convertedRetreatCost: json["convertedRetreatCost"],
        datumSet: Set.fromJson(json["set"]),
        number: json["number"],
        artist: json["artist"],
        rarity: json["rarity"],
        flavorText: json["flavorText"],
        nationalPokedexNumbers:
            List<int>.from(json["nationalPokedexNumbers"].map((x) => x)),
        legalities: Legalities.fromJson(json["legalities"]),
        images: DatumImages.fromJson(json["images"]),
        tcgplayer: Tcgplayer.fromJson(json["tcgplayer"]),
        cardmarket: Cardmarket.fromJson(json["cardmarket"]),
        evolvesTo: json["evolvesTo"] == null
            ? []
            : List<String>.from(json["evolvesTo"]!.map((x) => x)),
        rules: json["rules"] == null
            ? []
            : List<String>.from(json["rules"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "supertype": supertype,
        "subtypes": List<dynamic>.from(subtypes.map((x) => x)),
        "level": level,
        "hp": hp,
        "types": List<dynamic>.from(types!.map((x) => x)),
        "evolvesFrom": evolvesFrom,
        "abilities": abilities == null
            ? []
            : List<dynamic>.from(abilities!.map((x) => x.toJson())),
        "attacks": List<dynamic>.from(attacks!.map((x) => x.toJson())),
        "weaknesses": List<dynamic>.from(weaknesses!.map((x) => x.toJson())),
        "resistances": resistances == null
            ? []
            : List<dynamic>.from(resistances!.map((x) => x.toJson())),
        "retreatCost": retreatCost == null
            ? []
            : List<dynamic>.from(retreatCost!.map((x) => x)),
        "convertedRetreatCost": convertedRetreatCost,
        "set": datumSet!.toJson(),
        "number": number,
        "artist": artist,
        "rarity": rarity,
        "flavorText": flavorText,
        "nationalPokedexNumbers":
            List<dynamic>.from(nationalPokedexNumbers!.map((x) => x)),
        "legalities": legalities!.toJson(),
        "images": images!.toJson(),
        "tcgplayer": tcgplayer!.toJson(),
        "cardmarket": cardmarket!.toJson(),
        "evolvesTo": evolvesTo == null
            ? []
            : List<dynamic>.from(evolvesTo!.map((x) => x)),
        "rules": rules == null ? [] : List<dynamic>.from(rules!.map((x) => x)),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        attacks,
        weaknesses,
        artist,
        rarity,
        images,
        rules,
        types,
      ];
}

class Ability {
  final String name;
  final String text;
  final String type;

  Ability({
    required this.name,
    required this.text,
    required this.type,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        name: json["name"],
        text: json["text"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "text": text,
        "type": type,
      };
}

class Attack {
  final String name;
  final List<String> cost;
  final int convertedEnergyCost;
  final String damage;
  final String text;

  Attack({
    required this.name,
    required this.cost,
    required this.convertedEnergyCost,
    required this.damage,
    required this.text,
  });

  factory Attack.fromJson(Map<String, dynamic> json) => Attack(
        name: json["name"],
        cost: json["cost"] != null
            ? List<String>.from(json["cost"].map((x) => x.toString()))
            : [],
        convertedEnergyCost: json["convertedEnergyCost"],
        damage: json["damage"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "cost": List<dynamic>.from(cost.map((x) => [x])),
        "convertedEnergyCost": convertedEnergyCost,
        "damage": damage,
        "text": text,
      };
}

// enum Type { COLORLESS, GRASS, LIGHTNING, WATER }
//
// final typeValues = EnumValues({
//   "Colorless": Type.COLORLESS,
//   "Grass": Type.GRASS,
//   "Lightning": Type.LIGHTNING,
//   "Water": Type.WATER
// });

class Cardmarket {
  final String url;
  final String updatedAt;
  final Map<String, double> prices;

  Cardmarket({
    required this.url,
    required this.updatedAt,
    required this.prices,
  });

  factory Cardmarket.fromJson(Map<String, dynamic> json) => Cardmarket(
        url: json["url"],
        updatedAt: json["updatedAt"]!,
        prices: Map.from(json["prices"])
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "updatedAt": updatedAt,
        "prices":
            Map.from(prices).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class Set {
  final String id;
  final String name;
  final String series;
  final int printedTotal;
  final int total;
  final Legalities legalities;
  final String? ptcgoCode;
  final String releaseDate;
  final String updatedAt;
  final SetImages images;

  Set({
    required this.id,
    required this.name,
    required this.series,
    required this.printedTotal,
    required this.total,
    required this.legalities,
    this.ptcgoCode,
    required this.releaseDate,
    required this.updatedAt,
    required this.images,
  });

  factory Set.fromJson(Map<String, dynamic> json) => Set(
        id: json["id"],
        name: json["name"],
        series: json["series"],
        printedTotal: json["printedTotal"],
        total: json["total"],
        legalities: Legalities.fromJson(json["legalities"]),
        ptcgoCode: json["ptcgoCode"],
        releaseDate: json["releaseDate"],
        updatedAt: json["updatedAt"],
        images: SetImages.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "series": series,
        "printedTotal": printedTotal,
        "total": total,
        "legalities": legalities.toJson(),
        "ptcgoCode": ptcgoCode,
        "releaseDate": releaseDate,
        "updatedAt": updatedAt,
        "images": images.toJson(),
      };
}

class SetImages {
  final String symbol;
  final String logo;

  SetImages({
    required this.symbol,
    required this.logo,
  });

  factory SetImages.fromJson(Map<String, dynamic> json) => SetImages(
        symbol: json["symbol"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "logo": logo,
      };
}

class Legalities {
  final String? unlimited;
  final String? expanded;

  Legalities({
    this.unlimited,
    this.expanded,
  });

  factory Legalities.fromJson(Map<String, dynamic> json) => Legalities(
        unlimited: json["unlimited"] ?? '',
        expanded: json["expanded"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "unlimited": unlimited,
        "expanded": expanded,
      };
}

// enum Unlimited { LEGAL }
//
// final unlimitedValues = EnumValues({"Legal": Unlimited.LEGAL});

class DatumImages {
  final String small;
  final String large;

  DatumImages({
    required this.small,
    required this.large,
  });

  factory DatumImages.fromJson(Map<String, dynamic> json) => DatumImages(
        small: json["small"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "large": large,
      };
}

class Weakness {
  final String type;
  final String value;

  Weakness({
    required this.type,
    required this.value,
  });

  factory Weakness.fromJson(Map<String, dynamic> json) => Weakness(
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      };
}

class Tcgplayer {
  final String? url;
  final String? updatedAt;
  final Prices? prices;

  Tcgplayer({
    required this.url,
    required this.updatedAt,
    required this.prices,
  });

  factory Tcgplayer.fromJson(Map<String, dynamic> json) => Tcgplayer(
        url: json["url"],
        updatedAt: json["updatedAt"]!,
        prices: Prices.fromJson(json["prices"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "updatedAt": updatedAt,
        "prices": prices!.toJson(),
      };
}

class Prices {
  final Holofoil? holofoil;
  final Holofoil? reverseHolofoil;
  final Holofoil? normal;

  Prices({
    this.holofoil,
    this.reverseHolofoil,
    this.normal,
  });

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
        holofoil: json["holofoil"] == null
            ? null
            : Holofoil.fromJson(json["holofoil"]),
        reverseHolofoil: json["reverseHolofoil"] == null
            ? null
            : Holofoil.fromJson(json["reverseHolofoil"]),
        normal:
            json["normal"] == null ? null : Holofoil.fromJson(json["normal"]),
      );

  Map<String, dynamic> toJson() => {
        "holofoil": holofoil?.toJson(),
        "reverseHolofoil": reverseHolofoil?.toJson(),
        "normal": normal?.toJson(),
      };
}

class Holofoil {
  final double low;
  final double mid;
  final double high;
  final double market;
  final double? directLow;

  Holofoil({
    required this.low,
    required this.mid,
    required this.high,
    required this.market,
    required this.directLow,
  });

  factory Holofoil.fromJson(Map<String, dynamic> json) => Holofoil(
        low: json["low"]?.toDouble(),
        mid: json["mid"]?.toDouble(),
        high: json["high"]?.toDouble(),
        market: json["market"]?.toDouble(),
        directLow: json["directLow"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "low": low,
        "mid": mid,
        "high": high,
        "market": market,
        "directLow": directLow,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
