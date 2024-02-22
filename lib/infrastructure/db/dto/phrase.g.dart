// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phrase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhraseImpl _$$PhraseImplFromJson(Map<String, dynamic> json) => _$PhraseImpl(
      id: json['id'] as int,
      phrase: json['phrase'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PhraseImplToJson(_$PhraseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phrase': instance.phrase,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
