import 'dart:convert';

class Post {
  final String data;
  final String title;
  final String image;
  final String author;
  final String description;

  const Post({
    required this.data,
    required this.title,
    required this.image,
    required this.author,
    required this.description,
  });

  Post copyWith({
    String? data,
    String? title,
    String? image,
    String? author,
    String? description,
  }) {
    return Post(
      data: data ?? this.data,
      title: title ?? this.title,
      image: image ?? this.image,
      author: author ?? this.author,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'title': title,
      'image': image,
      'author': author,
      'description': description,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      data: map['data'] ?? '',
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      author: map['author'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(data: $data, title: $title, image: $image, author: $author, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Post &&
      other.data == data &&
      other.title == title &&
      other.image == image &&
      other.author == author &&
      other.description == description;
  }

  @override
  int get hashCode {
    return data.hashCode ^
      title.hashCode ^
      image.hashCode ^
      author.hashCode ^
      description.hashCode;
  }
}
