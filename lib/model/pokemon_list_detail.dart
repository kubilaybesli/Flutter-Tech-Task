import 'package:guven_future/model/base_model.dart';

class PokemonListDetailModel extends IBaseModel<PokemonListDetailModel>{

  int? id;
  int? order;
  int? height;
  int? weight;
  String? name;
  bool? isDefault;
  Ability? species;
  int? baseExperience;

  PokemonListDetailModel({
        this.id,
        this.name,
        this.order,
        this.weight,
        this.height,
        this.species,
        this.isDefault,
        this.baseExperience});

  PokemonListDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    order = json['order'];
    weight = json['weight'];
    height = json['height'];
    isDefault = json['is_default'];
    baseExperience = json['base_experience'];
    species = json['species'] != null ? Ability.fromJson(json['species']) : null;
  }

  @override
  PokemonListDetailModel fromJson(Map<String, dynamic> json) {
    return PokemonListDetailModel.fromJson(json);
  }
}

class Abilities {
  int? slot;
  bool? isHidden;
  Ability? ability;

  Abilities({this.ability, this.isHidden, this.slot});

  Abilities.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    isHidden = json['is_hidden'];
    ability = json['ability'] != null ? Ability.fromJson(json['ability']) : null;
  }
}

class Ability {
  String? name;
  String? url;

  Ability({this.name, this.url});

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}











