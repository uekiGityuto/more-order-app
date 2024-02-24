// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reason.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReasonImpl _$$ReasonImplFromJson(Map<String, dynamic> json) => _$ReasonImpl(
      id: json['id'] as int,
      reason: json['reason'] as String,
      isDefault: json['is_default'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ReasonImplToJson(_$ReasonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reason': instance.reason,
      'is_default': instance.isDefault,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
