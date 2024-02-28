class Tip {
  final String tip;
  final String category;

  Tip({
    required this.tip,
    required this.category
  });

  Tip.fromJson(Map<String, dynamic> json)
    : tip = json['tip'] as String,
      category = json['category'] as String;

  Map<String, dynamic> toJson() => {
    'tip': tip,
    'category': category,
  };
}
