import 'package:flutter/material.dart';

class WorkingWithConstraints extends StatelessWidget {
  const WorkingWithConstraints({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Working With Constraints'),
        ),
        body: const Column(
          children: <Widget>[
            InvoiceScreen(),
          ],
        ),
      );
}

Widget _body() => Center(
      child: Container(
        color: Colors.blue[200],
        height: 75,
        width: 120,
        child: const Center(child: Text('Pending')),
      ),
    );

// ////

// const double sqrVal = 38;
// const double factor = 2.25;

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return ListView.builder(itemCount: 5,itemBuilder:(context, index) => )
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          // const TittleIconListTile(),
          for (int i = 0; i < 12; i++) _invoiceListTile()
        ],
      ),
    );
  }
}

Widget _invoiceListTile() {
  const double offsetVal = 2;
  const double blur = 18;
  final shadowColor = CustomTheme.lightColors['shade2'] as Color;
  return Padding(
    // padding:
    //     const EdgeInsets.symmetric(horizontal: CustomTheme.mainContentPadding),
    padding: const EdgeInsets.only(
        left: CustomTheme.mainContentPadding,
        right: CustomTheme.mainContentPadding,
        top: 24.0,
        bottom: 0),
    child: Container(
      height: 142,
      decoration: BoxDecoration(
        color: CustomTheme.lightColors['shade3'],
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: shadowColor,
            offset: const Offset(offsetVal, offsetVal),
            blurRadius: blur,
            spreadRadius: 2.0,
          ),
          BoxShadow(
            color: shadowColor,
            offset: const Offset(offsetVal * -1, offsetVal * -1),
            blurRadius: blur,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[_listTileLeftSide(), _rightSide()],
        ),
      ),
    ),
  );
}

Widget _listTileLeftSide() => const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('#RT3080'),
        Text('Due 19 Aug 2021'),
        Text('\$1,800.90'),
      ],
    );

Widget _rightSide() {
  const double circleSize = 10;
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      const Text('Baki Hanma'),
      Container(
        height: 46.75,
        width: 112.25,
        color: const Color.fromARGB(50, 118, 238, 122),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
            width: circleSize,
            height: circleSize,
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
          ),
          Gaps.gapw10,
          const Text('Pending')
        ]),
      )
    ],
  );
}

class Gaps {
  const Gaps();
  static const SizedBox gaph1 = SizedBox(height: 1);
  static const SizedBox gaph2 = SizedBox(height: 2);
  static const SizedBox gaph4 = SizedBox(height: 4);
  static const SizedBox gaph6 = SizedBox(height: 6);
  static const SizedBox gaph8 = SizedBox(height: 8);
  static const SizedBox gaph10 = SizedBox(height: 10);
  static const SizedBox gaph12 = SizedBox(height: 12);
  static const SizedBox gaph14 = SizedBox(height: 14);
  static const SizedBox gaph16 = SizedBox(height: 16);
  static const SizedBox gaph18 = SizedBox(height: 18);

  static const SizedBox gapw1 = SizedBox(width: 1);
  static const SizedBox gapw2 = SizedBox(width: 2);
  static const SizedBox gapw4 = SizedBox(width: 4);
  static const SizedBox gapw6 = SizedBox(width: 6);
  static const SizedBox gapw8 = SizedBox(width: 8);
  static const SizedBox gapw10 = SizedBox(width: 10);
  static const SizedBox gapw12 = SizedBox(width: 12);
  static const SizedBox gapw14 = SizedBox(width: 14);
  static const SizedBox gapw16 = SizedBox(width: 16);
  static const SizedBox gapw18 = SizedBox(width: 18);

  static SizedBox width(double w) => SizedBox(width: w);
  static SizedBox heigth(double h) => SizedBox(height: h);
}

class CustomTheme {
  const CustomTheme();

  static const double mainContentPadding = 18.0;
  static const Map<String, Color> darkColors = {
    'shade0': Color.fromRGBO(12, 14, 22, 1),
    'shade1': Color.fromRGBO(20, 22, 37, 1),
    'shade2': Color.fromRGBO(30, 33, 57, 1),
    'shade3': Color.fromRGBO(37, 41, 69, 1),
  };

  static const Map<String, Color> lightColors = {
    'shade0': Color.fromRGBO(126, 136, 195, 1),
    'shade1': Color.fromRGBO(136, 142, 176, 1),
    'shade2': Color.fromRGBO(223, 227, 250, 1),
    'shade3': Color.fromRGBO(248, 248, 251, 1),
  };

  static const Map<String, Color> otherColors = {
    'purple0': Color.fromRGBO(124, 93, 250, 1),
    'purple1': Color.fromRGBO(146, 119, 255, 1),
    'red0': Color.fromRGBO(236, 87, 87, 1),
    'red1': Color.fromRGBO(255, 151, 151, 1),
  };
}
