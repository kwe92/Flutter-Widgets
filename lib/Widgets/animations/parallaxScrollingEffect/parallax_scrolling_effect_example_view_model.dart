import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/parallaxScrollingEffect/location.dart';
import 'package:flutter_widgets/Widgets/animations/parallaxScrollingEffect/services/location_service.dart';

class ParallaxScrollingEffectExampleViewModel with ChangeNotifier {
  List<Location> get locations => locationService.locations;

  Future<void> getLocations() async {
    try {
      await locationService.getLocations();
    } catch (err, st) {
      debugPrint(err.toString());
      debugPrint(st.toString());
      rethrow;
    }
  }
}


// rethrow

//   - traditionally, catching or handling an exception stops the error from propagating down the call stack

//   - the rethrow keyword allows you to partially catch an exception do something and then let the exeption continue down the call stack

//   - one scenario where rethrow is especially useful is when you are letting FutureBuilder or StreamBuilder handle the error but still want to show
//     stack trace information to other engineers or your future self