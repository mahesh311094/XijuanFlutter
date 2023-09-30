class InterestedGenderModel {
  int? id;
  String? gender;

  InterestedGenderModel({
    this.id,
    this.gender,
  });

  @override
  String toString() {
    return '{id: $id, gender: $gender}';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'gender': gender,
    };
  }
}

List<InterestedGenderModel> interestedGenderList = [];

List<Map<String, dynamic>> encodedInterestedGenderList =
    interestedGenderList.map((matches) => matches.toJson()).toList();
