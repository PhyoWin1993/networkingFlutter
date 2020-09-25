class PostList {
  final List<Post> posts;

  PostList({this.posts});
  factory PostList.fromJson(List<dynamic> parsedJson) {
    List<Post> posts = new List<Post>();
    posts = parsedJson.map((e) => Post.fromJson(e)).toList();
    return new PostList(posts: posts);
  }
}

class Post {
  int userId;
  int id;
  String title, body;
  Post({this.userId, this.id, this.title, this.body}); // naming parameter

  // List<Post> getData() => [
  //       Post(3, 3, "ksjf", "kdjfd"),
  //       Post(3, 3, "ksjf", "kdjfd"),
  //       Post(3, 3, "ksjf", "kdjfd"),
  //       Post(3, 3, "ksjf", "kdjfd"),
  //       Post(3, 3, "ksjf", "kdjfd"),
  //     ];

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json["userId"],
        id: json['id'],
        title: json["title"],
        body: json['body']);
  }
}
