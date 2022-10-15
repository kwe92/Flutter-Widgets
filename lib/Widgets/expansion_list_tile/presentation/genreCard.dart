import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/constants/layout.dart';

class GenreCard extends StatelessWidget {
  const GenreCard(
      { //required this.genre,
      required this.image,
      required this.description,
      super.key});
  //final String genre;
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.grey[300],
      elevation: 12.0,
      margin: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
          //   child: Center(
          //     child: Text(
          //       genre,
          // style: const TextStyle(
          //   fontSize: 52,
          //   fontFamily: Fonts.secondary,
          // ),
          //     ),
          //   ),
          // ),
          // gapH4,
          SizedBox(
            height: 400,
            //width: 30,
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.asset(image, fit: BoxFit.fill),
            ),
          ),
          gapH8,
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description:',
                      style: TextStyle(
                          fontSize: Sizes.p26, fontFamily: Fonts.main),
                    ),
                    gapH8,
                    Padding(
                      padding: const EdgeInsets.fromLTRB(Sizes.p16, 0, 0, 0),
                      child: Text(
                        description,
                        style: const TextStyle(
                            fontSize: Sizes.p26, fontFamily: Fonts.main),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Padding(
//             padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            // child: Text(
            //   'Description:',
            //   textAlign: TextAlign.left,
            //   style: TextStyle(fontSize: 26.0),
            // ),
//           ),
//           gapH8,
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
//                 child: Text(
//                   description,
//                   style: const TextStyle(fontSize: 20.0),
//                   textAlign: TextAlign.left,
//                 ),
//               ),
//             ),
//           ),

////////////////////////

//  const Padding(
//             padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
//             child: Text(
//               'Description:',
//               textAlign: TextAlign.left,
//               style: TextStyle(fontSize: 26.0),
//             ),
//           ),
//           gapH8,
          // Expanded(
          //   child: SingleChildScrollView(
          //     child: Padding(
          //       padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          //       child: Text(
          //         description,
          //         style: const TextStyle(fontSize: 20.0),
          //         textAlign: TextAlign.left,
          //       ),
          //     ),
          //   ),
//           ),

// Sliver Scroll

// Expanded(
//             child: CustomScrollView(
//               slivers: [
//                 SliverList(
//                   delegate: SliverChildListDelegate(
//                     <Widget>[
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
//                         child: Text(
//                           'Description:',
//                           textAlign: TextAlign.left,
//                           style: TextStyle(fontSize: 26.0),
//                         ),
//                       ),
//                       gapH8,
//                       Expanded(
//                         child: SingleChildScrollView(
//                           child: Padding(
//                             padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
//                             child: Text(
//                               description,
//                               style: const TextStyle(fontSize: 20.0),
//                               textAlign: TextAlign.left,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           )