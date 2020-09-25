import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ex/model/post.dart';
import 'package:http/http.dart';

class JsonParsingMap extends StatefulWidget {
  @override
  _JsonParsingMapState createState() => _JsonParsingMapState();
}

class _JsonParsingMapState extends State<JsonParsingMap> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Network {
  final String url;

  Network(this.url);
  Future<PostList> loadPost() async {
    final respone = await get(Uri.encodeFull(url));
    if (respone.statusCode == 200) {
      return PostList.fromJson(json.decode(respone.body));
    } else {
      throw ("Could not connected.");
    }
  }
}
