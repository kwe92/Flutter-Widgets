import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/quotes_feature/services/scaffold_navigation_controller.dart';
import 'package:flutter_widgets/Widgets/quotes_feature/ui/quotes_view_model.dart';
import 'package:provider/provider.dart';

class ScaffoldWithNavigation extends StatelessWidget {
  final Color? backgroundColor;

  const ScaffoldWithNavigation({
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ScaffoldNavigationController(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuotesViewModel(),
        ),
      ],
      builder: (context, _) {
        final model = context.watch<ScaffoldNavigationController>();

        return Scaffold(
          backgroundColor: backgroundColor ?? const Color(0xff131b24),
          body: Center(
            child: model.widgetOptions[model.selectedIndex],
          ),

          // TODO: Implement top navigation bar instead maybe ?? | users say they like bottom nav

          bottomNavigationBar: Builder(builder: (context) {
            return Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
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
                selectedItemColor: Colors.white70,
                unselectedItemColor: Colors.white30,
                onTap: model.onItemTapped,
              ),
            );
          }),
        );
      },
    );
  }
}
