
part of 'hive.dart';


class NewsAdapter extends TypeAdapter<News> {
  @override
  final int typeId = 1;

  @override
  News read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return News(
      url: fields[0] as String,
      name: fields[1] as String,
      width: fields[4] as String,
      height: fields[3] as String,
      urlToImage: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, News obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.name)

      ..writeByte(3)
      ..write(obj.height)

      ..writeByte(4)
      ..write(obj.width)

      ..writeByte(5)
      ..write(obj.urlToImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
