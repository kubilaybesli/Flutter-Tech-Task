import 'package:guven_future/service/base_service.dart';
import 'package:guven_future/model/pokemon_list_detail.dart';
import 'package:guven_future/user_interface/helper/navigation_url.dart';

 class PokemonListDetailService extends BaseService {

  Future<PokemonListDetailModel> pokemonListDetailPost(int id) async {
  return await get<PokemonListDetailModel>(
      "${NavigationUrl.pokemonListUrl}/$id",
      model: PokemonListDetailModel(),
      );
    }
  }

