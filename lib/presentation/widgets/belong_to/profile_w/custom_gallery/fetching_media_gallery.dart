import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';


Future<FutureBuilder<Uint8List?>> getImageGallery(
    List<AssetEntity> media, int i) async {
  FutureBuilder<Uint8List?> futureBuilder = FutureBuilder(
    future: media[i].thumbnailDataWithSize(const ThumbnailSize(200, 200)),
    builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Uint8List? image = snapshot.data;
        if (image != null) {
          return Container(
            color: Colors.grey,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.memory(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                if (media[i].type == AssetType.video)
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 5, bottom: 5),
                      child: Icon(
                        Icons.slow_motion_video_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          );
        }
      }
      return Container();
    },
  );
  return futureBuilder;
}
Future<File?> highQualityImage(List<AssetEntity> media, int i) async =>
    media[i].loadFile();