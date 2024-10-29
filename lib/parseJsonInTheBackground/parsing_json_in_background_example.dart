import 'package:flutter/material.dart';
import 'package:flutter_widgets/parseJsonInTheBackground/repositories/json_placeholder_repo.dart';
import 'package:provider/provider.dart';

class ParsingJsonInBackgroundExample extends StatelessWidget {
  const ParsingJsonInBackgroundExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: JsonPlaceholderRepo.instance,
        builder: (context, _) {
          final viewModel = context.read<JsonPlaceholderRepo>();

          return FutureBuilder<void>(
              future: viewModel.getPhotos(),
              builder: (context, snapshot) {
                return SafeArea(
                  child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: const Color(0xff200589),
                      title: const Text(
                        'Isolate Demo',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    body: snapshot.connectionState == ConnectionState.done
                        ? !snapshot.hasError
                            ? ListView.separated(
                                itemCount: viewModel.photos.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    width: double.maxFinite,
                                    height: 350,
                                    child: Image.network(
                                      viewModel.photos[1].url,
                                      fit: BoxFit.cover,
                                      loadingBuilder: (context, child, loadingProgress) => Stack(
                                        children: [
                                          Image.asset('assets/isekai.jpeg'),
                                          const Center(child: CircularProgressIndicator()),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => const SizedBox(height: 4),
                              )
                            : Center(
                                child: SizedBox(
                                  child: Text(snapshot.error.toString()),
                                ),
                              )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                );
              });
        });
  }
}

// Jank 

//   - when an apps animations stutter or lag the first time they run

// Default Dart App Behavior

//   - by default all processing is done on a single thread

//   - jank is experienced of an operation takes longer than 16 miliseconds

//   - to handle work separately you need to isolate that work
//     which is were Dart Isolates come into play

// Dart Isolate

//   - all code that runs in Dart runs in an Isolate

//   - each isolate has its own memory and its own event loop (Queue of Events)

//   - as the name implies Isolates are isolated from one another

//   - they can not share mutable data so no locks or Mutexs are required

//   - Isolates can communicate with one another through mesage passing

//   - Isolates can send values and receive values through the SendPort and ReceivePort API's respectfully

//   - Isolates have their own even loop

//   - there are optional capabilities you can add to an isolate to control apects of the Isolate like puasing and termination

// When to Use Isolates

//   - when you havean expensive operation that you do not want interfering with the main Isolates event loop