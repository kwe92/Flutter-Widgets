// TODO: Edit and rewrite don paper

// Provider Package

//   - a wrapper around InheritedWidget adding additional features and ease of use

//   - makes state management a breeze and allow developers to build an MVVM architecture with ease

// What Providers Offer

//   - simplified allcoation and disposal of resources

//   - declarative abstraction of low level implementation details

//   - lazy loading

//   - reduced boiler plate code

//   - application state visible in dev tools

//   - multiple ways of InheritedWidget consumption

//   - provides a notification / listening mechinism to classes dispatched with linear time complexity O(n)
//     using ChangeNotifier's


// Declarative Instantiation and Abstraction

//   - ChangeNotifierProvider and ChangeNotifier Relationship

//       - a ChangeNotifier is declaratively instantiated within a ChangeNotifierProvider via callback passed to the create field

//       - the creation, storage, and disposal of the ChangeNotifier is abstracted away from the user

//       - there is a 1-to-1 relationship between an ChangeNotifierProvider and ChangeNotifier object
//         one ChangeNotifierProvider initialization cereates one ChangeNotifier instance that propigates downwward to decendant widgets

//   ~ ChangeNotifier Creation:

//       - a ChangeNotifier is instantiated once and only once when the associated ChangeNotifierProvider is initialized

//       - the afromentioned process removes the need to manually create a ChangeNotifier and removes the need to worry about object creation

//   ~ ChangeNotifier Storage:

//       - the associated ChangeNotifierProvider manages the storage of its created ChangeNotifier

//       - the ChangeNotifierProvider ensures that all decendent widgets in your widget tree have access to the ChangeNotifier

//       - the afromention process removes the need to maintain references to a CHangeNotifier or manually pass it around your widget tree



//   ~ ChangeNotifier Disposal:

//       - a ChangeNotifierProvider handles the disposal of a ChangeNotifer when it is no longer in use

//       - when a ChangeNotifierProvider is removed from the widget tree the associated ChangeNotifier is disposed

//       - the afromentioned process removes the need to manually call dispose method of a ChangeNotifier or manage its life cycle with life cycle methods



// Benefits of Declarative Instantiation and Abstraction of ChangeNotifier Objects

//   - Reduction in the amount of boilerplate code developers have to write

//   - you can focus on the what (providing a ChangeNotifer to manage some state)
//     rather than the how (managing the low level details of a ChangeNotifier life cycle)

//   - automatic and abstracted life cycle management reduces the amount of errors a developer will write
//     due to memory leaks or improper object management

// TODO: continue writig summary

// Summary

//   - the declarative approach of instantiation and abstraction of ChangeNotifer with a ChangeNotifierProvider
//     allows you to express your intention of what you want to do (provide a ChangeNotifier to decendent widgets in yourr widget tree to observe some state and change its UI accordingly)
//     instead of worrying about how low level implementation details are handled

//  TODO: whats the big picture and point, why does this help me as a developer




