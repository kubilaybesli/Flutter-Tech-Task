import 'package:guven_future/model/base_model.dart';

class PokemonListModel  extends IBaseModel<PokemonListModel>{
  int? count;
  List<Results>? results;

  PokemonListModel({this.count, this.results});

  PokemonListModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
        results = <Results>[];
        json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  @override
  PokemonListModel fromJson(Map<String, dynamic> json) {
    return PokemonListModel.fromJson(json);
  }
}

class Results {
  String? name;
  String? url;

  Results({this.name, this.url});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
