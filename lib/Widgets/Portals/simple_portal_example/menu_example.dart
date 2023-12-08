import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

class MenuExample extends StatefulWidget {
  const MenuExample({super.key});

  @override
  State<MenuExample> createState() => _MenuExampleState();
}

class _MenuExampleState extends State<MenuExample> {
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PortalTarget(
          // follower visibility | set by some mutable state
          visible: isMenuOpen,
          // follower positioning | relative to target
          anchor: const Aligned(
            follower: Alignment.topLeft,
            target: Alignment.topRight,
          ),
          // follower instantiation | floating widget you want to display
          portalFollower: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                isMenuOpen = false;
              });
              debugPrint("tapped outside of widget");
            },
            // target instantiation | widget you wish to attach follower to
            child: const Material(
              elevation: 8,
              child: SizedBox(
                width: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text("Option 1"),
                    ),
                    ListTile(
                      title: Text("Option 2"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                isMenuOpen = !isMenuOpen;
              });
            },
            child: const Text("show menu"),
          ),
        ),
      ),
    );
  }
}

// TODO: review and edit notes

// Showing Floating Overlays in Flutter

//   - you can use flutters standard Overlay and OverlayEntry
//     to show floating overlays and animated floating overlays
//      such as tooltips and floating modals

//   - Overlay and OverlayEntry take an imperative approcah to showing
//     floating widgets rather than a declarative approach

// Showing Floating Overlays in Flutter With Portals

//   - flutter_portal is a package that simplifies the proccess of
//     adding a floating overlay to your widget tree

//   - flutter_portal also offers easy alignment of portal follower (the floating widget)
//     and portal target (the widget you want the floating widget to be attached to)

//   - the portal follower (floating widget) is aligned relative to the
//     child of a PortalTarget

// Portal

//   - should be inserted at the top of your widget tree if possible
//   - this implies that your MaterialApp should be wrapped with a Portal widget
//   - Follower widgets will behave like they are children of the Portal widget you inserted
//   - There only needs to be one portal widget for the entire app
//   - inserting a single Portal allows your entire app to have Followers (floating widgets) connected to Targets (widget that would be nn the normal widget tree)
//   - used to show content above some other content (not in the literal since, the content can be positioned to the side or bellow)
//   - if a Portal is inserted at the top of your Widget tree the PortalTarget can persist above all routes (like a snackBar that is shown even when the initiating route is poped off of the stack)
//   - similar to how you should wrap your entire app with a Provider for change notifiers

// Target | child property of PortalTarget

//   - any part of your widget tree that is a decendent of a Portal widget that you wish to follow (have some floating overlay attached to it)
//   - followers are attached to targets which can be overlayed anywhere in your UI as long as there is an ancestor Portal widget
//   - to attach a follower to a target you must wrap the target widget with a PortalTarget

// Follower | portalFollower property of PortalTarget

//   - the floating overlay that is attached to a target
//   - can only be used in combination with a target
//   - followers are overlayed on top of your UI and attached to targets

// Anchor | anchor property of a PortalTarget

//   - how the follower is positioned relative to the target
//   - you can use built-in Aligned or Filled classes to position
//     a follower relative to a target

// PortalTarget

//   - wraps your target and attaches a single follower to it
//   - also determines how a follower is positioned relative to a target
//   - informs the Portal that there is a follower/target relationship
//   - the child (target widget you wish to be overlayed) is rendered normally in the widget tree
//     the portalFollower (floating overlay widget) is rendered on top of your UI through the ancestor Portal in a diffrent location
//     in thre widget tree, hence the name Portal
//   - also controls the visibility of the follower with some mutable boolean variable

// Why Use Portal and PortalTarget Over Overlay and OverlayEntry?

//   - attchment of follower and target are easier
//   - positioning of follower relative to the target is easier
//   - managing the visibility state of the follower is easier
//   - less code to write


// PortalTarget Important Properties

//   - visible: the visability of the floatingg overlay widget | should be mutable and have some way to turn off and on
//   - portalFollower: the floating widget you wish to align relative to the child (portal target)
//   - anchor: how you wish the portal follower (floating widget) to be aligned relative to the child (portal target)



