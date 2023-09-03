import 'package:flutter/material.dart';
import 'package:guven_future/model/pokemon_list.dart';
import 'package:guven_future/service/pokemon_list.dart';

class PokemonListProvider extends ChangeNotifier {
  int pageNo = 0;
  int? pokemonListId;
  bool isLoading = true;
  PokemonListModel pokemonListModel = PokemonListModel();

  isLoadingEd() {
    isLoading = true;
    notifyListeners();
  }

  pokemonListIdEd() {
    pokemonListId = null;
    notifyListeners();
  }

  pageNumbered() {
    pageNo = pageNo+10;
    notifyListeners();
  }

  void pokemonListRequest({int? offset, int? limit}) {

    PokemonListService().pokemonListPost(offset: offset, limit: limit).then((data) => {
      pokemonListModel.results == null
       ? pokemonListModel.results = data.results
       : pokemonListModel.results?.addAll(data.results!),
         notifyListeners()
    });

  }
}