import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/shared/model/destination.dart';

final destinationService = DestinationService();

const fakeBackendData =
    '''[{"name":"Andes Mountain","continent":"South, America","description":"The Andes, running along South America's western side, is among the world's longest mountain ranges. Its varied terrain encompasses glaciers, volcanoes, grassland, desert, lakes and forest. The mountains shelter pre-Columbian archaeological sites and wildlife including chinchillas and condors.","price":230,"temperature":16,"rating":4.5,"flightDuration":8,"image":"/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/andes-mountain.png"},
        {"name":"Mount Fuji","continent":"Tokyo, Japan","description":"Japan’s Mt. Fuji is an active volcano about 100 kilometers southwest of Tokyo. Commonly called “Fuji-san,” it’s the country’s tallest peak, at 3,776 meters. A pilgrimage site for centuries, it’s considered one of Japan’s 3 sacred mountains, and summit hikes remain a popular activity.","price":675,"temperature":23,"rating":4.7,"flightDuration":12,"image":"/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/mount-fuji-by-night.jpeg"},
        {"name":"Geirangerfjord","continent":"Geirangerfjord, Norway","description":"he Geiranger Fjord is a fjord in the Sunnmøre region of Møre og Romsdal county, Norway. It is located entirely in the Stranda Municipality. It is a 15-kilometre-long branch off the Sunnylvsfjorden, which is a branch off the Storfjorden.","price":785,"temperature":22,"rating":4.8,"flightDuration":12,"image":"/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/geiranger-fjord-norway.jpeg"},
        {"name":"Podyjí National Park","continent":"Czech Republic,Europe","description":"Podyjí National Park is a national park in the South Moravian Region of the Czech Republic. Adjacent to Austria's Thayatal National Park on the border, together they are referred to as the Inter-National park. Podyjí is one of the Czech Republic's four national parks.","price":460,"temperature":24,"rating":4.8,"flightDuration":13,"image":"/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/podyji-national-park.jpeg"},
        {"name":"Kangaroo Island","continent":"Kangaroo Island, Australia","description":"Kangaroo Island lies off the mainland of South Australia, southwest of Adelaide. Over a third of the island is protected in nature reserves, home to native wildlife like sea lions, koalas and diverse bird species. In the west, Flinders Chase National Park is known for penguin colonies and striking coastal rock formations, like the sculpted Remarkable Rocks and the stalactite-covered Admirals Arch.","price":585,"temperature":21,"rating":4.6,"flightDuration":7,"image":"/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/kangaroo-island.jpeg"},
        {"name":"Bridal Veil Falls","continent":"Oregon, United States","description":"Located just off the Columbia River Highway, at the site of an old lumber mill, this state park features two short hikes, one to beautiful Bridal Veil Falls and the other showcasing views of the Columbia River.The lower trail is a steep, 0.3-mile descent to the base of the magnificent waterfall. The falls duck under the Old Columbia River Gorge Highway's 1914 bridge and over mossy basalt in two tiers, a drop of about 120 feet altogether.","price":225,"temperature":21,"rating":4.8,"flightDuration":14,"image":"/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/oregon.jpeg"}]''';

class DestinationService extends ChangeNotifier {
  List<Destination> _destinations = [];

  List<Destination> get destinations => _destinations;

  Future<List<Destination>> fetchData() async {
    await Future.delayed(const Duration(seconds: 2, milliseconds: 500));

    final List resonse = jsonDecode(fakeBackendData);

    final List<Map<String, dynamic>> data = List.from(resonse);

    _destinations = [for (Map<String, dynamic> json in data) Destination.fromMap(json)];

    print(_destinations);

    return _destinations;
  }
}
