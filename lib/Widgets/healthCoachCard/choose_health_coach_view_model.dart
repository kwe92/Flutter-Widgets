import 'package:flutter_widgets/Widgets/healthCoachCard/model/care_navigator.dart';
import 'package:stacked/stacked.dart';

// ?? Done
class ChooseCareNavigatorViewModel extends BaseViewModel {
  // !! add | add getter method
  List<CareNavigator> _carNavs = [];
  // !! add
  int _currentIndex = -1;

  // !! maybe add
  List<int> _indexState = [];

// !! add
  int get currentIndex => _currentIndex;

  List<CareNavigator> get carNavs => _carNavs;

  // !! add
  void setCurrentIndex(int index) {
    _indexState.add(index);
    print('indexState: $_indexState');

    if (_indexState.length > 1) {
      if (_closeButtonPressed()) {
        resetAllIndices();
        print('indexState: $_indexState');
        return;
      } else {
        _indexState.removeAt(0);
      }
    }

    _currentIndex = index;
    notifyListeners();
  }

  void resetAllIndices() {
    _currentIndex = -1;
    _indexState = [];
    notifyListeners();
  }

  bool _closeButtonPressed() => _indexState[0] == _indexState[1];

  // !! add
  Future<void> initialize() async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 2));
    _carNavs = [
      CareNavigator(
        firstName: 'Baki 0',
        lastName: 'Hanma',
        bio:
            'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
        role: 'Grappler',
        image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
      ),
      CareNavigator(
        firstName: 'Baki 1',
        lastName: 'Hanma',
        bio:
            'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
        role: 'Grappler',
        image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
      ),
      CareNavigator(
        firstName: 'Baki 2',
        lastName: 'Hanma',
        bio:
            'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
        role: 'Grappler',
        image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
      ),
      CareNavigator(
        firstName: 'Baki 3',
        lastName: 'Hanma',
        bio:
            'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
        role: 'Grappler',
        image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
      ),
      CareNavigator(
        firstName: 'Baki 4',
        lastName: 'Hanma',
        bio:
            'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
        role: 'Grappler',
        image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
      ),
      CareNavigator(
        firstName: 'Baki 5',
        lastName: 'Hanma',
        bio:
            'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
        role: 'Grappler',
        image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
      ),
      CareNavigator(
        firstName: 'Baki 6',
        lastName: 'Hanma',
        bio:
            'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
        role: 'Grappler',
        image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
      ),
      CareNavigator(
        firstName: 'Baki 7',
        lastName: 'Hanma',
        bio:
            'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
        role: 'Grappler',
        image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
      ),
      CareNavigator(
        firstName: 'Baki 8',
        lastName: 'Hanma',
        bio:
            'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
        role: 'Grappler',
        image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
      ),
      CareNavigator(
        firstName: 'Baki 9',
        lastName: 'Hanma',
        bio:
            'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
        role: 'Grappler',
        image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
      ),
      CareNavigator(
        firstName: 'Baki 10',
        lastName: 'Hanma',
        bio:
            'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
        role: 'Grappler',
        image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
      ),
    ];

    setBusy(false);

    notifyListeners();
  }

  // @override
  // Future<List<CareNavigator>> futureToRun() => () async {
  //       await Future.delayed(const Duration(seconds: 2));
  //       return [
  //         CareNavigator(
  //           firstName: 'Baki',
  //           lastName: 'Hanma',
  //           bio:
  //               'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
  //           role: 'Grappler',
  //           image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
  //         ),
  //         CareNavigator(
  //           firstName: 'Baki',
  //           lastName: 'Hanma',
  //           bio:
  //               'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
  //           role: 'Grappler',
  //           image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
  //         ),
  //         CareNavigator(
  //           firstName: 'Baki',
  //           lastName: 'Hanma',
  //           bio:
  //               'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
  //           role: 'Grappler',
  //           image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
  //         ),
  //         CareNavigator(
  //           firstName: 'Baki',
  //           lastName: 'Hanma',
  //           bio:
  //               'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
  //           role: 'Grappler',
  //           image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
  //         ),
  //         CareNavigator(
  //           firstName: 'Baki',
  //           lastName: 'Hanma',
  //           bio:
  //               'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
  //           role: 'Grappler',
  //           image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
  //         ),
  //         CareNavigator(
  //           firstName: 'Baki',
  //           lastName: 'Hanma',
  //           bio:
  //               'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
  //           role: 'Grappler',
  //           image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
  //         ),
  //         CareNavigator(
  //           firstName: 'Baki',
  //           lastName: 'Hanma',
  //           bio:
  //               'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
  //           role: 'Grappler',
  //           image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
  //         ),
  //         CareNavigator(
  //           firstName: 'Baki',
  //           lastName: 'Hanma',
  //           bio:
  //               'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
  //           role: 'Grappler',
  //           image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
  //         ),
  //         CareNavigator(
  //           firstName: 'Baki',
  //           lastName: 'Hanma',
  //           bio:
  //               'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
  //           role: 'Grappler',
  //           image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
  //         ),
  //         CareNavigator(
  //           firstName: 'Baki',
  //           lastName: 'Hanma',
  //           bio:
  //               'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
  //           role: 'Grappler',
  //           image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
  //         ),
  //         CareNavigator(
  //           firstName: 'Baki',
  //           lastName: 'Hanma',
  //           bio:
  //               'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.',
  //           role: 'Grappler',
  //           image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
  //         ),
  //       ];
  //     }();
}
