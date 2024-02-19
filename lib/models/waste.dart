class Waste {
  final String id;
  final String name;
  final String photo;
  final String advice;
  final String carbonFootprint;
  final String userId;
  final DateTime createdAt;

  Waste({
    required this.id,
    required this.name,
    required this.photo,
    required this.advice,
    required this.carbonFootprint,
    required this.userId,
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
      'created_at': createdAt.toIso8601String(),
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
      createdAt: DateTime.parse(map['created_at']),
    );
  }
}
