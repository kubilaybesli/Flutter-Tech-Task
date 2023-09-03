
import 'package:guven_future/model/pokemon_list.dart';
import 'package:guven_future/service/base_service.dart';
import 'package:guven_future/user_interface/helper/navigation_url.dart';

 class PokemonListService extends BaseService {

  Future<PokemonListModel> pokemonListPost({int? offset, int? limit}) async {
    var params = {'offset': offset,'limit':limit};

  return await get<PokemonListModel>(
      NavigationUrl.pokemonListUrl,
      model: PokemonListModel(),
      params: params
      );
    }
  }

