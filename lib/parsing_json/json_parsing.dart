import 'dart:convert';

import 'package:ex/model/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'json_parsing_map.dart';

class JsonParsingSimple extends StatefulWidget {
  @override
  _JsonParsingSimpleState createState() => _JsonParsingSimpleState();
}

class _JsonParsingSimpleState extends State<JsonParsingSimple> {
  Future<PostList> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = Network("https://jsonplaceholder.typicode.com/posts").loadPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PoDoLo"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: data,
            builder: (context, AsyncSnapshot<PostList> snapshot) {
              List<Post> allPost;
              if (snapshot.hasData) {
                allPost = snapshot.data.posts;
                return _createListViews(allPost, context);
              } else {
                return CircularProgressIndicator();
              }
              // return _createListViews();
            },
          ),
        ),
      ),
    );
  }

  Widget _createListViews(List<Post> posts, BuildContext context) {
    // this come with many object List
    return Container(
      child: ListView.builder(
        itemCount: posts.length, // for object item loop
        itemBuilder: (context, index) {
          // this is just like for looping  (itemBuilder)
          return InkWell(
            child: Column(
              children: [
                Divider(
                  height: 5.0,
                ),
                ListTile(
                  title: Text("${posts[index].title}"),
                  subtitle: Text("${posts[index].body}"),
                  leading: Column(
                    children: [
                      CircleAvatar(
                        radius: 23,
                        backgroundColor: Colors.amber,
                        child: Text("${posts[index].id}"),
                      )
                    ],
                  ),
                )
              ],
            ),
            onTap: () {
              final snapbar = SnackBar(
                content: Text("hellwo"),
              );
              Scaffold.of(context).showSnackBar(snapbar);
            },
          );
        },
      ),
    );
  }
}

// Widget createListView(List data, BuildContext context) {
//   return Container(
//     child: ListView.builder(
//         itemCount: data.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Column(
//             children: [
//               Divider(height: 5.0),
//               ListTile(
//                 title: Text("${data[index]["title"]}"),
//                 subtitle: Text("${data[index]["body"]}"),
//                 leading: Column(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.black26,
//                       radius: 23,
//                       child: Text("${data[index]["id"]}"),
//                     ),
//                     // Text("Testing"),
//                   ],
//                 ),
//               )
//             ],
//           );
//         }),
//   );
// }
