import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widgets/Widgets/quotes_feature/ui/quotes_view_model.dart';
import 'package:provider/provider.dart';

class QuotesView extends StatelessWidget {
  QuotesView({super.key});

  final modelNotifier = QuotesViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff131b24),
      // appBar: AppBar(
      //   title: const Text(
      //     "Zen Quotes Example",
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      //   backgroundColor: const Color(0xff1d2530),
      // ),
      body: ChangeNotifierProvider.value(
        value: modelNotifier,
        builder: (context, _) {
          const style = TextStyle(
            color: Colors.white,
            fontSize: 26,
          );

          final model = Provider.of<QuotesViewModel>(context);

          return model.isBusy
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.purple,
                  ),
                )
              : PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: model.quotes.length,
                  itemBuilder: (context, index) {
                    return model.selectedIndex == 0
                        ? Stack(
                            children: [
                              Center(
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height / 2,
                                  child: Stack(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Positioned.fill(
                                        // TODO: ensure that the scale is a good size
                                        child: Transform.scale(
                                          // scale: 1.0625,
                                          scaleY: 1.325,
                                          scaleX: 1.0625,

                                          child: SvgPicture.asset(
                                            "/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/quotes-background-image.svg",
                                            color: const Color(0xff1d2530),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            // padding: const EdgeInsets.only(left: 32, top: 0, right: 32),
                                            padding: const EdgeInsets.symmetric(horizontal: 32),

                                            child: Align(
                                              child: Text(
                                                model.quotes[index].quote,
                                                style: style.copyWith(color: Colors.white.withOpacity(0.90)),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "- ${model.quotes[index].author}",
                                              style: style.copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 42),
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.ios_share,
                                            size: 52,
                                            color: Colors.blue.withOpacity(0.60),
                                          ),
                                          IconButton(
                                            onPressed: () => model.setLikedForQuote(model.quotes[index]),
                                            icon: Icon(
                                              model.quotes[index].isLiked ? Icons.favorite : Icons.favorite_outline,
                                              size: 52,
                                              color: Colors.red.withOpacity(0.60),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          )
                        : Center(
                            child: model.widgetOptions[model.selectedIndex],
                          );
                  },
                );
        },
      ),

      // TODO: Implement top navigation bar instead maybe ?? | users say they like bottom nav

      bottomNavigationBar: ChangeNotifierProvider.value(
        value: modelNotifier,
        child: Builder(builder: (context) {
          final model = context.watch<QuotesViewModel>();
          return BottomNavigationBar(
            backgroundColor: const Color(0xff131b24),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.article_outlined),
                label: 'Quotes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: 'Liked',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book_online_rounded),
                label: 'Journal',
              ),
            ],
            currentIndex: model.selectedIndex,
            // selectedItemColor: Colors.green[600],
            selectedItemColor: Colors.white70,

            unselectedItemColor: Colors.white30,
            onTap: model.onItemTapped,
          );
        }),
      ),
    );
  }
}

// class QuotesView extends StatelessWidget {
//   const QuotesView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Zen Quotes Example",
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: const Color(0xff1d2530),
//       ),
//       body: ChangeNotifierProvider(
//         create: (context) => QuotesViewModel(),
//         builder: (context, _) {
//           const style = TextStyle(
//             color: Colors.white,
//             fontSize: 26,
//           );

//           final model = Provider.of<QuotesViewModel>(context);

//           return model.isBusy
//               ? const Center(
//                   child: CircularProgressIndicator(
//                     color: Colors.purple,
//                   ),
//                 )
//               : PageView.builder(
//                   scrollDirection: Axis.vertical,
//                   itemCount: model.quotes.length,
//                   itemBuilder: (context, index) {
//                     return Stack(
//                       children: [
//                         Container(
//                           // margin: const EdgeInsets.all(16),
//                           padding: const EdgeInsets.all(16),
//                           width: double.maxFinite,
//                           color: const Color(0xff131b24),
//                         ),
//                         // Positioned.fill(
//                         //   child: SvgPicture.asset(
//                         //     "/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/quotes-background-image.svg",
//                         //     color: const Color(0xff1d2530),
//                         //   ),
//                         // ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height / 2,
//                           child: Stack(
//                             // mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Positioned.fill(
//                                 child: SvgPicture.asset(
//                                   "/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/quotes-background-image.svg",
//                                   color: const Color(0xff1d2530),
//                                 ),
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(horizontal: 32),
//                                     child: Align(
//                                       child: Text(
//                                         model.quotes[index].quote,
//                                         style: style,
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 12),
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       "- ${model.quotes[index].author}",
//                                       style: style.copyWith(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//         },
//       ),
//     );
//   }
// }
