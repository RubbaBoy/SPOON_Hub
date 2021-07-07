import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spoon_hub/scoped_model/home_model.dart';
import 'package:spoon_hub/ui/views/base_view.dart';
import 'package:spoon_hub/ui/widgets/now_playing_widget.dart';
import 'package:spoon_hub/ui/widgets/queue_widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) => BaseView(
        builder: (BuildContext context, Widget? child, HomeModel model) =>
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Row(
                children: [

                  Expanded(
                    child: const Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0))
                      ),
                      child: Center(
                          child: NowPlayingWidget()  // PUT NOW PLAYING HERE
                      ),
                    ),
                  ),

                  Container(
                    width: 25,
                  ),

                  Expanded(
                    // FIXME add rounded rect border bit with radius 25
                    child: const Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0))
                      ),
                      child: Center(
                          child: QueueList()  // PUT QUEUE HERE
                      )
                    ),
                  )

                ]
              ),
            )
      );
}
