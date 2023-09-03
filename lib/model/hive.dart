
import 'package:hive_flutter/hive_flutter.dart';
part 'hive.g.dart';

@HiveType(typeId: 1)
class News extends HiveObject {
  @HiveField(0)
  late String url;
  @HiveField(1)
  late String name;
  @HiveField(3)
  late String height;
  @HiveField(4)
  late String width;
  @HiveField(5)
  late String urlToImage;


  News({
    required this.url,
    required this.name,
    required this.width,
    required this.height,
    required this.urlToImage,
  });
}