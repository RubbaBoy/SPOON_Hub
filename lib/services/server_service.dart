import 'dart:convert';
import 'dart:io';

// ill put this in a class soon
  void main(){
    ServerSocket.bind('0.0.0.0', 8081)
        .then((serverSocket) {
      serverSocket.listen((socket) {  // listen for client
        socket.map(utf8.decode).map(jsonDecode).listen((json) {  // listens for data
          print('Got $json');

          switch (json["name"]){
            case "search":
              //
              socket.write("I haven't implemented the search function yet");
              // call spotify service and search
              break;
            case "upvote":
              socket.write("I havne't implemented upvote yet");
              break;
            case "downvote":
              socket.write("i havne't made downvote");
              break;
            case "addQueue":
              socket.write("addqueeu is unimplemented and speklled wrong in this string oops");
              break;
          }



        });
      });
    });
  }

