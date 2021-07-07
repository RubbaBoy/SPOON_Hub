import 'dart:io';
import 'dart:convert';
import 'package:spotify/spotify.dart';


class SpotifyService{

  SpotifyApi? spotify;

  void login() async {
    var keyJson = await File('creds.json').readAsString();
    var keyMap = json.decode(keyJson);
    var credentials = SpotifyApiCredentials(keyMap['id'], keyMap['secret']);
    spotify = SpotifyApi(credentials);
  }


  // get currently playing
  // add to queue
  // get queue
  Future<List<Track>> search(String searchString) async {
    var found = <Track>[];
    var searched = await spotify?.search?.get(searchString, types: [SearchType.track]);
    var page = await searched!.first();  // a liiiitle risky, but not really i think, assumes spotify?.search?.get() returns something
    for (var p in page){
      for (var item in p.items!.cast<Track>()){
        found.add(item);
        // DEBUG
        print(item);
      }
    }
    return found;
  }




}