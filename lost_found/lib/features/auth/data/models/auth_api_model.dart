import 'package:lost_n_found/features/auth/domain/entities/auth_entity.dart';
import 'package:lost_n_found/features/batch/data/models/batch_api_model.dart';

class AuthApiModel {
  final String? id;
  final String fullName;
  final String email;
  final String? phoneNumber;
  final String username;
  final String? profilePicture;
  final String? batchId;
  final String? password;
  final BatchApiModel? batch;

  AuthApiModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.username,
    this.profilePicture,
    this.batchId,
    required this.password,
    this.batch,
  });

  //to json

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'username': username,
      'profilePicture': profilePicture,
      'batchId': batchId,
      'password': password,
      'batch': batch?.toJson(),
    };
  }

  //from json
  factory AuthApiModel.fromJson(Map<String, dynamic> json) {
    return AuthApiModel(
      id: json['id'] as String?,
      fullName: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      username: json['username'] as String,
      profilePicture: json['profilePicture'] as String?,
      batchId: json['batchId'] as String?,
      password: json['password'] as String?,
      batch: json['batch'] != null
          ? BatchApiModel.fromJson(json['batch'] as Map<String, dynamic>)
          : null,
    );
  }

  //toEntity
  AuthEntity toEntity() {
    return AuthEntity(
      authId: id,
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      username: username,
      profilePicture: profilePicture,
      batchId: batchId,
      password: password,
      batch: batch?.toEntity(),
    );
  }

  //fromEntity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      id: entity.authId,
      fullName: entity.fullName,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      username: entity.username,
      profilePicture: entity.profilePicture,
      batchId: entity.batchId,
      password: entity.password,
      batch: entity.batch != null
          ? BatchApiModel.fromEntity(entity.batch!)
          : null,
    );
  }

  //toEntityList
  static List<AuthEntity> toEntityList(List<AuthApiModel> apiModels) {
    return apiModels.map((model) => model.toEntity()).toList();
  }
}
