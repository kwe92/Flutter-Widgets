import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/models/photo.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/database_service.dart';

class PhotoProvider {
  PhotoProvider._();

  static Future<List<int>> insert(List<Photo> images) async {
    List<int> imageIds = [];
    for (int i = 0; i < images.length; i++) {
      imageIds.add(await databaseService.db.insert(databaseService.tables.images, images[i].toMap()));
    }

    return imageIds;
  }

  static Future<List<Photo>> getAllImages() async {
    final List<Map<String, dynamic>> result = await databaseService.db.query(databaseService.tables.images);

    final List<Photo> images = [for (Map<String, dynamic> image in result) Photo.fromJSON(image)];

    return images;
  }

  static Future<void> delete(Photo image) async {
    await databaseService.db.delete(databaseService.tables.images, where: 'id = ?', whereArgs: [image.id]);
  }

  static Future<void> deleteMulti(List<Photo?> images) async {
    for (var i = 0; i < images.length; i++) {
      await databaseService.db.delete(databaseService.tables.images, where: 'id = ?', whereArgs: [images[i]?.id]);
    }
  }

  static Future<void> edit(Photo image) async {
    await databaseService.db.update(
      databaseService.tables.images,
      image.toMap(),
      where: 'id = ?',
      whereArgs: [image.id],
    );
  }
}
