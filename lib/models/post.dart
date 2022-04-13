import 'dart:convert';

import 'package:voluntary/models/contacts.dart';

class Post {
  final String id;
  final String data;
  final String title;
  final String? image;
  final String author;
  final String description;
  final Contacts contacts;

  const Post({
    required this.id,
    required this.data,
    required this.title,
    this.image,
    required this.author,
    required this.description,
    required this.contacts,
  });

  Post copyWith({
    String? id,
    String? data,
    String? title,
    String? image,
    String? author,
    String? description,
    Contacts? contacts,
  }) {
    return Post(
      id: id ?? this.id,
      data: data ?? this.data,
      title: title ?? this.title,
      image: image ?? this.image,
      author: author ?? this.author,
      description: description ?? this.description,
      contacts: contacts ?? this.contacts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'data': data,
      'title': title,
      'image': image,
      'author': author,
      'description': description,
      'contacts': contacts.toMap(),
    };
  }

  factory Post.fromMap(Map<String, dynamic> map, [String? id]) {
    return Post(
      id: id ?? map['id'],
      data: map['data'] ?? '',
      title: map['title'] ?? '',
      image: map['image'],
      author: map['author'] ?? '',
      description: map['description'] ?? '',
      contacts: Contacts.fromMap(map['contacts']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(id: $id, data: $data, title: $title, image: $image, author: $author, description: $description, contacts: $contacts)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
        other.id == id &&
        other.data == data &&
        other.title == title &&
        other.image == image &&
        other.author == author &&
        other.description == description &&
        other.contacts == contacts;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        data.hashCode ^
        title.hashCode ^
        image.hashCode ^
        author.hashCode ^
        description.hashCode ^
        contacts.hashCode;
  }
}
