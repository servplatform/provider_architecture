import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:provider_start/core/serializers/serializers.dart';
import 'package:provider_start/core/serializers/user.dart';

part 'post.g.dart';

/// An example post model that should be serialized.
///   - @nullable: means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     recieve from an API
abstract class Post implements Built<Post, PostBuilder> {
  static Serializer<Post> get serializer => _$postSerializer;

  @BuiltValueField(wireName: 'userId')
  int get id;

  String get title;

  @BuiltValueField(wireName: 'body')
  String get description;

  User get user;

  String toJson() {
    return json.encode(serializers.serializeWith(Post.serializer, this));
  }

  static Post fromJson(String jsonString) {
    return serializers.deserializeWith(
      Post.serializer,
      json.decode(jsonString),
    );
  }

  static Post fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      Post.serializer,
      map,
    );
  }

  Post._();
  factory Post([void Function(PostBuilder) updates]) = _$Post;
}
