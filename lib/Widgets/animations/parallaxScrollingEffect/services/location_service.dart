import 'package:flutter/foundation.dart';
import 'package:flutter_widgets/Widgets/animations/parallaxScrollingEffect/location.dart';

LocationService get locationService => LocationService();

const _urlPrefix = 'https://docs.flutter.dev/cookbook/img-files/effects/parallax';

class LocationService with ChangeNotifier {
  static final _instance = LocationService._internal();

  List<Location> _locations = [];

  List<Location> get locations => _locations;

  LocationService._internal();

  factory LocationService() => _instance;

  Future<void> getLocations() async {
    // simulate backend data retrieval delay
    await Future<void>.delayed(const Duration(seconds: 2));

    // throw Exception("status 404");

    // typically deserialization happens here
    _locations = _fakeDeserializationProcess();

    notifyListeners();
  }
}

List<Location> _fakeDeserializationProcess() => const [
      Location(
        name: 'Mount Rushmore',
        place: 'U.S.A',
        imageUrl: '$_urlPrefix/01-mount-rushmore.jpg',
      ),
      Location(
        name: 'Gardens By The Bay',
        place: 'Singapore',
        imageUrl: '$_urlPrefix/02-singapore.jpg',
      ),
      Location(
        name: 'Machu Picchu',
        place: 'Peru',
        imageUrl: '$_urlPrefix/03-machu-picchu.jpg',
      ),
      Location(
        name: 'Vitznau',
        place: 'Switzerland',
        imageUrl: '$_urlPrefix/04-vitznau.jpg',
      ),
      Location(
        name: 'Bali',
        place: 'Indonesia',
        imageUrl: '$_urlPrefix/05-bali.jpg',
      ),
      Location(
        name: 'Mexico City',
        place: 'Mexico',
        imageUrl: '$_urlPrefix/06-mexico-city.jpg',
      ),
      Location(
        name: 'Cairo',
        place: 'Egypt',
        imageUrl: '$_urlPrefix/07-cairo.jpg',
      ),
    ];
