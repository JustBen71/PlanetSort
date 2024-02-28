import 'package:cloud_firestore/cloud_firestore.dart';

class Waste {
  final String id;
  final String name;
  final String photo;
  final String advice;
  final String carbonFootprint;
  final String userId;
  final String openAiRequest;
  final String openAiResponse;
  final Map<String, dynamic> additionalProperties;
  final DateTime createdAt;

  Waste({
    required this.id,
    required this.name,
    required this.photo,
    required this.advice,
    required this.carbonFootprint,
    required this.userId,
    required this.openAiRequest,
    required this.openAiResponse,
    required this.additionalProperties,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'photo': photo,
      'advice': advice,
      'carbon_footprint': carbonFootprint,
      'user_id': userId,
      'openai_request': openAiRequest,
      'openai_response': openAiResponse,
      'additional_properties': additionalProperties,
      'created_at': Timestamp.fromDate(createdAt),
    };
  }

  factory Waste.fromMap(Map<String, dynamic> map) {
    return Waste(
      id: map['id'],
      name: map['name'],
      photo: map['photo'],
      advice: map['advice'],
      carbonFootprint: map['carbon_footprint'],
      userId: map['user_id'],
      openAiRequest: map['openai_request'],
      openAiResponse: map['openai_response'],
      additionalProperties: map['additional_properties'],
      createdAt: (map['created_at'] as Timestamp).toDate(),
    );
  }
}
