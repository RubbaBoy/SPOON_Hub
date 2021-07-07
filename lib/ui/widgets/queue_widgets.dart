

import 'package:flutter/material.dart';

class QueueList extends StatefulWidget {
  const QueueList({Key? key}) : super(key: key);

  @override
  _QueueListState createState() => _QueueListState();
}

class _QueueListState extends State<QueueList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [Text("bruh")], // Put queue here
        // TODO make the widget pull current queue from spotify api
      ),
    );
  }
}


// ill do this later
class QueueItem extends StatefulWidget {
  const QueueItem({Key? key}) : super(key: key);

  @override
  _QueueItemState createState() => _QueueItemState();
}

class _QueueItemState extends State<QueueItem> {
  @override
  Widget build(BuildContext context) {
    return Card(

    );
  }
}
