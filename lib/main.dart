import 'package:flutter/material.dart';

// Flutter实战*第二版
// https://www.woolha.com/tutorials/flutter-using-futurebuilder-widget-examples

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: FutureBuilderExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

Future<String> getValue() async {
  await Future.delayed(Duration(seconds: 3));
  return 'Woolha';
}

class FutureBuilderExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FutureBuilderExampleState();
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {
  late Future<String> _value;

  @override
  void initState() {
    super.initState();
    _value = getValue();
  }

  String _title = 'Hi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Woolha.com Flutter Tutorial')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _title = _title + ".";
          });
        },
        child: Icon(Icons.title),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: FutureBuilder<String>(
            future: _value,
            initialData: 'App Name',
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              print('State: ${snapshot.connectionState}');
              print('State is Active ${ConnectionState.active == snapshot.connectionState}');
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Visibility(
                      child: Text(
                        snapshot.data ?? "NULL",
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  return Text(
                    snapshot.data ?? 'NULL',
                    style: const TextStyle(color: Colors.teal, fontSize: 36),
                  );
                } else {
                  return const Text('Empty data');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            },
          ),
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Woolha.com Flutter Tutorial',
//       home: FutureBuilderExample(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// Future<String> getValue() async {
//   await Future.delayed(Duration(seconds: 3));
//
//   return 'Woolha';
// }
//
// class FutureBuilderExample extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _FutureBuilderExampleState ();
//   }
// }
//
// class _FutureBuilderExampleState extends State<FutureBuilderExample> {
//
//   Future<String> _value;
//
//   @override
//   initState() {
//     super.initState();
//     _value = getValue();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Woolha.com Flutter Tutorial'),
//       ),
//       body: SizedBox(
//         width: double.infinity,
//         child: Center(
//           child: FutureBuilder<String>(
//             future: _value,
//             initialData: 'App Name',
//             builder: (
//                 BuildContext context,
//                 AsyncSnapshot<String> snapshot,
//                 ) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CircularProgressIndicator(),
//                     Visibility(
//                       visible: snapshot.hasData,
//                       child: Text(
//                         snapshot.data,
//                         style: const TextStyle(color: Colors.black, fontSize: 24),
//                       ),
//                     )
//                   ],
//                 );
//               } else if (snapshot.connectionState == ConnectionState.done) {
//                 if (snapshot.hasError) {
//                   return const Text('Error');
//                 } else if (snapshot.hasData) {
//                   return Text(
//                       snapshot.data,
//                       style: const TextStyle(color: Colors.teal, fontSize: 36)
//                   );
//                 } else {
//                   return const Text('Empty data');
//                 }
//               } else {
//                 return Text('State: ${snapshot.connectionState}');
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
