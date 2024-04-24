// Provider Package

//   - a wrapper around InheritedWidget adding additional features and ease of use

// What Providers Offer

//   - simplified state management

//   = simplified allcoation and disposal of resources used by ChangeNotifier's

//   - declarative abstraction of low level implementation details

//   - lazy loading (lazy be default, can be disabled by setting the `lazy` field to false)

//   - reduced boiler plate code

//   - application state visible in dev tools

//   - multiple ways of InheritedWidget consumption (Provider.of, context.watch, Consumer, Selector)

//   - provides a notification / listening mechinism dispatched with linear time complexity O(n)
//     using ChangeNotifier's

// ChangeNotifier

//   - ChangeNotifier's are an easy way to encapsulate your applications state

//   - can be extended or mixed in to data structures to implement the Listenable interface

//   - data structures extending or mixing in a ChangeNotifier can be used as reactive data models

//   - provides change notifications to listeners triggering U.I. updates

// notifyListeners Method

//       - notifyListeners triggers U.I. updates informing all listening reactive widgets to rebuild
//         through their builder callback for all Consumer's, ChangeNotifyProvider's, Selector's etc

// ChangeNotifierProvider

//       - ChangeNotifierProvider provides an instance of a ChangeNotifier to its descendant Widgets

//       - should be placed as low in the Widget tree as possible

// Declarative Instantiation and Abstraction

//   - ChangeNotifierProvider and ChangeNotifier Relationship

//       - a ChangeNotifier is declaratively instantiated within a ChangeNotifierProvider via a callback passed to the `create` field

//       - the creation, storage, and disposal of the ChangeNotifier is abstracted away from the user by the ChangeNotifierProvider

//       - there is a 1-to-1 relationship between an ChangeNotifierProvider and ChangeNotifier object
//         one ChangeNotifierProvider initialization creates one ChangeNotifier instance that propagates downward to descendant widgets

//   ~ ChangeNotifier Creation:

//       - a ChangeNotifier is instantiated once and only once when the associated ChangeNotifierProvider is initialized

//       - instantiating a ChangeNotifier will expose the ChangeNotifier object to be read by descendant Widgets

//       - the afromentioned process removes the need to manually create a ChangeNotifier and removes the need to worry about object creation

//   ~ ChangeNotifier Storage:

//       - the associated ChangeNotifierProvider manages the storage of its created ChangeNotifier

//       - the ChangeNotifierProvider ensures that all descendant widgets in your widget tree have access to the ChangeNotifier

//       - the afromentioned process removes the need to maintain references to a ChangeNotifier or manually pass it around your widget tree

//   ~ ChangeNotifier Disposal:

//       - a ChangeNotifierProvider handles the disposal of a ChangeNotifer when it is no longer in use

//       - when a ChangeNotifierProvider is removed from the widget tree the associated ChangeNotifier is disposed

//       - the afromentioned process removes the need to manually manage the life cycle of a ChangeNotifier

// Descendants Reading Exposed ChangeNotifier values

//   - Reactive ChangeNotifier Value Reading (U.I. Refresh)

//       - Provider.of<T>(context) | static method

//       - context.watch<T>() | extenion method on BuildContext | syntactic sugar for Provider.of<T>(this)

//       - context.select<T, R>(R cb(T value)) | listen to a subset of a ChangeNotifier's values | extenion method on BuildContext

//   - Non-reactive ChangeNotifier Value Reading (No U.I. Refresh)

//       - Provider.of<T>(context, listen: false) | static method

//       - context.read<T>() | extenion method on BuildContext | syntactic sugar for Provider.of<T>(this, listen: false)

//   - Consumer

//       - used to obtain the exposed values of a change notifier when there is no available BuildContext

//       - can also reduce the amount of unnecessary rebuilds by providing fine grain granularity on which widgets are rebuilt when an exposed value is reacted to

//       - should be placed as deep in the widget tree as possible to not rebuild large parts of the U.I. that do not depend on the mutable state being changed 

//   - Selector

//       - has the same properties as a Consumer with the added ability to filter only a select number of
//         values to reactively listen too similar to context.select<T, R>(R cb(T value))


// Benefits of Declarative Instantiation and Abstraction of ChangeNotifier Objects

//   - Reduction in the amount of boilerplate code developers have to write

//   - you can focus on the what (providing a ChangeNotifer to manage some state)
//     rather than the how (managing the low level details of a ChangeNotifier life cycle)

//   - automatic and abstracted life cycle management reducing the amount of errors a developer will write
//     due to memory leaks or improper object management

// TODO: continue summary

// Summary

//   - the declarative approach of instantiation and abstraction of ChangeNotifer with a ChangeNotifierProvider
//     allows you to express your intention of what you want to do (provide a ChangeNotifier to descendant widgets in yourr widget tree to observe some state and change its UI accordingly)
//     instead of worrying about how low level implementation details are handled

//  TODO: whats the big picture and point, why does this help me as a developer




