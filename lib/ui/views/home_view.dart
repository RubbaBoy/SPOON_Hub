import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spoon_hub/scoped_model/home_model.dart';
import 'package:spoon_hub/ui/views/base_view.dart';

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
                      child: Center(
                          child: Text("Benis!")  // PUT QUEUE HERE
                      )
                    ),
                  )

                ]
              ),
            )
      );
}


class NowPlayingWidget extends StatefulWidget {
  const NowPlayingWidget({Key? key}) : super(key: key);

  @override
  _NowPlayingWidgetState createState() => _NowPlayingWidgetState();
}

class _NowPlayingWidgetState extends State<NowPlayingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // album art
          height: 500,
          width: 500,
          child: Image.network(  // FIXME pull image from now playing song
              "https://i.scdn.co/image/ab67616d00001e02a4fe57b156def68bdcc6f58b",
              fit: BoxFit.contain
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top:50),
          child: Text("Song Name goes here",  // FIXME pull song name from now playing, possibly add scrolling on too long
            style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white)  // may cause problems if we do theming
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text("Artist Name",  // FIXME pull artist name from now playing
            style: Theme.of(context).textTheme.subtitle1
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 50),
          // FIXME replace with widget from adam
          child: Container(
            height: 10,
            width: 650,
            color: Color.fromRGBO(0xFF, 0, 0xFF, 1),
          ),
        ),
        
        Padding(
          padding: EdgeInsets.only(top:50),

          // Play skip and previous song icons
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){print("Previous Song");},
                child: Icon(
                  Icons.skip_previous,
                  size: 50
                )
              ),


              Padding(
                padding: EdgeInsets.only(left:60),
                child: GestureDetector(
                  onTap: (){print("You pressed Play/pause");},
                  child: Container(
                    child: Icon(
                      Icons.pause_circle ,  // depending on state, display play_arrow/pause_circle
                      size: 60, // idk looked nice i think
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: GestureDetector(
                  onTap: (){print("you Pressed skip song");},
                  child: Container(
                    child: Icon(
                      Icons.skip_next,
                      size: 50,
                    ),
                  )
                ),
              )

            ],
          ),
        ),
        
      ],
    );
  }
}



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
        children: [], // Put queue here
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
