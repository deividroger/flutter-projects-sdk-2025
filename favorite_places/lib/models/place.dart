import 'dart:io';

import 'package:uuid/uuid.dart';

final uuid = const Uuid();

class Place {
  Place({
    required this.title,
    required this.image,
    required this.location,
    String? id,
  }) : id = id ?? uuid.v4();

  final String id;
  final String title;
  final File image;
  final PlaceLocation location;
}

class PlaceLocation {
  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  final double latitude;
  final double longitude;
  final String address;

  String locationImage() {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude=&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=AIzaSyCW64IlVsCqY6VPY-fUqHhBELiTT7VPtSE';
  }
}
