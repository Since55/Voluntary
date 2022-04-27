class City {
  final String id;
  final String objectCategory;
  final String objectName;
  final String region;
  final String community;

  City({
    required this.id,
    required this.objectCategory,
    required this.objectName,
    required this.region,
    required this.community,
  });

  String get fullName =>
      '${objectCategory.toLowerCase()} $objectName, $community, $region';

  City copyWith({
    String? id,
    String? objectCategory,
    String? objectName,
    String? region,
    String? community,
  }) {
    return City(
      id: id ?? this.id,
      objectCategory: objectCategory ?? this.objectCategory,
      objectName: objectName ?? this.objectName,
      region: region ?? this.region,
      community: community ?? this.community,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object_category': objectCategory,
      'object_name': objectName,
      'region': region,
      'community': community,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id'] ?? '',
      objectCategory: map['object_category'] ?? '',
      objectName: map['object_name'] ?? '',
      region: map['region'] ?? '',
      community: map['community'] ?? '',
    );
  }

  @override
  String toString() {
    return 'City(id: $id, objectCategory: $objectCategory, objectName: $objectName, region: $region, community: $community)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is City &&
        other.id == id &&
        other.objectCategory == objectCategory &&
        other.objectName == objectName &&
        other.region == region &&
        other.community == community;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        objectCategory.hashCode ^
        objectName.hashCode ^
        region.hashCode ^
        community.hashCode;
  }
}
