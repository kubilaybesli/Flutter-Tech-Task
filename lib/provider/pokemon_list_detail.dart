import 'package:flutter/material.dart';
import 'package:guven_future/model/pokemon_list_detail.dart';
import 'package:guven_future/service/pokemon_list_detail.dart';

class PokemonListDetailProvider extends ChangeNotifier {
  int pageNo = 1;
  bool isLoading = true;
  PokemonListDetailModel? pokemonListDetailModel =  PokemonListDetailModel();

  isLoadingEd() {
    isLoading = true;
    notifyListeners();
  }

  pageNumbered() {
    pageNo = pageNo+10;
    notifyListeners();
  }

  void pokemonListDetailRequest(BuildContext context,int id) {
    PokemonListDetailService().pokemonListDetailPost(id).then((data)=>{
      pokemonListDetailModel = data,
      notifyListeners()
    });
  }
}