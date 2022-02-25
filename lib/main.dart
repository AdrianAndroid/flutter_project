import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banner',
      home: Scaffold(
        appBar: AppBar(title: Text('Banner')),
        body: Container(
          child: SlidablePage(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SlidablePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SlidablePageState();
}

class _SlidablePageState extends State<SlidablePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              child: Slidable(
                // Specify a key if the Slidable is dismissible
                key: const ValueKey(0),
                // The start action pane is the one at the left or the top side
                startActionPane: ActionPane(
                  // A motion is a widget used to control how the pane animates
                  motion: const ScrollMotion(),
                  // A pane can dismiss the Slidable
                  dismissible: DismissiblePane(onDismissed: () {
                    print('DismissiblePane');
                  }),
                  // All actions are defined in the children parameter.
                  children: [
                    // A SlidableAction can have a icon and/or a label.
                    SlidableAction(
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                      onPressed: (context) {
                        print('Slidableaction onPressed: Delete');
                      },
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        print('Slidableaction onPressed: Share');
                      },
                      backgroundColor: Color(0xFF21B7CA),
                      foregroundColor: Colors.white,
                      icon: Icons.share,
                      label: 'Share',
                    ),
                  ],
                ),
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      flex: 2,
                      onPressed: (context) {
                        print('Slidableaction onPressed: Archive');
                      },
                      backgroundColor: Color(0xFF7BC043),
                      foregroundColor: Colors.white,
                      icon: Icons.archive,
                      label: 'Archive',
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        print('Slidableaction onPressed: Save');
                      },
                      backgroundColor: Color(0xFF0392CF),
                      foregroundColor: Colors.white,
                      icon: Icons.save,
                      label: 'Save',
                    ),
                  ],
                ),
                child: const ListTile(title: Text('Slideme')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
