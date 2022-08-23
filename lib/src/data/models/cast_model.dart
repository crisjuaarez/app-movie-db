import 'dart:convert';

import 'package:app_cinema/src/domain/entities/cast.dart';

CastModel castFromJson(String str) => CastModel.fromJson(json.decode(str));

String castToJson(CastModel data) => json.encode(data.toJson());

class CastModel extends Cast {
  CastModel({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    this.castId,
    required this.character,
    this.creditId,
    this.order,
  }) : super(
          character: character,
          name: name,
          originalName: originalName,
          popularity: popularity,
          adult: adult,
          castId: castId,
          creditId: creditId,
          gender: gender,
          id: id,
          knownForDepartment: knownForDepartment,
          order: order,
          profilePath: profilePath,
        );

  @override
  final bool? adult;
  @override
  final int? gender;
  @override
  final int? id;
  @override
  final String? knownForDepartment;
  @override
  final String name;
  @override
  final String originalName;
  @override
  final double popularity;
  @override
  final String? profilePath;
  @override
  final int? castId;
  @override
  final String character;
  @override
  final String? creditId;
  @override
  final int? order;

  @override
  Map<String, dynamic> toMap() {
    return {
      'adult': adult,
      'gender': gender,
      'id': id,
      'knownForDepartment': knownForDepartment,
      'name': name,
      'originalName': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
      'castId': castId,
      'character': character,
      'creditId': creditId,
      'order': order,
    };
  }

  factory CastModel.fromMap(Map<String, dynamic> map) {
    return CastModel(
      adult: map['adult'],
      gender: map['gender']?.toInt(),
      id: map['id']?.toInt(),
      knownForDepartment: map['knownForDepartment'],
      name: map['name'] ?? '',
      originalName: map['originalName'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      profilePath: map['profile_path'],
      castId: map['castId']?.toInt(),
      character: map['character'] ?? '',
      creditId: map['creditId'],
      order: map['order']?.toInt(),
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory CastModel.fromJson(String source) =>
      CastModel.fromMap(json.decode(source));
}
