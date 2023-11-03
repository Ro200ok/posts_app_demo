// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      json['postId'] as int?,
      json['id'] as int?,
      json['name'] as String?,
      json['email'] as String?,
      json['body'] as String?,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
