import 'package:flutter_widgets/Widgets/healthCoachCard/model/care_navigator.dart';
import 'package:stacked/stacked.dart';

class ChooseCareNavigatorViewModel extends FutureViewModel {
  @override
  Future<List<CareNavigator>> futureToRun() {
    return () async {
      await Future.delayed(const Duration(seconds: 2));
      return [
        CareNavigator(
          firstName: 'Baki',
          lastName: 'Hanma',
          bio:
              'Baki the Grappler (Japanese: グラップラー刃牙, Hepburn: Gurappurā Baki) is a Japanese manga series written and illustrated by Keisuke Itagaki. It was originally serialized in the shōnen manga magazine Weekly Shōnen Champion from 1991 to 1999 and collected into 42 tankōbon volumes by Akita Shoten. The story follows teenager Baki Hanma as he trains and tests his fighting skills against a variety of different opponents in deadly, no rules hand-to-hand combat.The series was followed by five sequels in the same magazine; Baki (バキ, officially romanized as New Grappler Baki: In Search of Our Strongest Hero), which was serialized from 1999 to 2005 and collected into 31 volumes, Baki Hanma (範馬刃牙, Hanma Baki, officially romanized as Baki: Son of Ogre), which was serialized from 2005 to 2012 and collected into 37 volumes, Baki-Dou (刃牙道, Baki Dō, lit. "Bakis Style"), which was serialized from 2014 to 2018 and collected into 22 volumes, a fifth series, also named Bakidou (バキ道) but with Bakis name written in katakana instead of kanji, serialized from 2018 to 2023 and collected into 17 volumes, and Baki Rahen (刃牙らへん, Baki Rahen, lit. "Baki and Others"), serialized from 2023.',
          role: 'Grappler',
          image: '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
        ),
        // CareNavigator(),
        // CareNavigator(),
        // CareNavigator(),
        // CareNavigator(),
        // CareNavigator(),
        // CareNavigator(),
        // CareNavigator(),
        // CareNavigator(),
        // CareNavigator(),
        // CareNavigator(),
        // CareNavigator(),
      ];
    }();
  }
}
