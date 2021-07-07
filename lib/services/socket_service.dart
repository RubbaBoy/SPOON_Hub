import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:spoon_hub/utility.dart';
import 'package:tuple/tuple.dart';

class SocketService {
  late final ServerSocket _serverSocket;

  // make list of active sockets
  final activeSockets = <Socket>[];

  final controller = StreamController<Tuple2<Json,Socket>>.broadcast();

  /// Starts the socket, connecting to the TV/server program. Returns true if
  /// the connection was successful, false if otherwise.
  Future<bool> startSocket() async {
    return ServerSocket.bind('0.0.0.0', 8099)
        .then((serverSocket) {  // once its bound
      _serverSocket = serverSocket;
      serverSocket.listen((socket) {  // when someone connects
        socket
            .map(utf8.decode)
            .map(jsonDecode)
            .listen((json) => controller.add(Tuple2(json, socket)));
      });
      return true;
    }).catchError((e, s) => false);
  }

  /// Writes to the socket with a given [name], [uuid], and [data],
  Future<Json> writeSocket(String name, Json data) {
    final completer = Completer<Json>();

    _serverSocket.forEach((socket) => socket.write(jsonEncode({'name': name, 'uuid': genUuid(), ...data})));
    return completer.future;
  }

  /// Listens to incoming socket messages with the name of [name]. When
  /// received, the [callback] should return a [Json] response. In this
  /// response, `name` and `uuid` are NOT required.
  void listenTo(String name, Future<Json> Function(Json json) callback) {
    controller.stream.listen((tuple) {
      var json = tuple.item1;
      if (json['name'] == name) {
        callback(json).then((result) => tuple.item2.write(  // corresponding socket to json data
            jsonEncode({'name': name, 'uuid': json['uuid'], ...result})));
      }
    });
  }
}