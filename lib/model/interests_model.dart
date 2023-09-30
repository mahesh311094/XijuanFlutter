class InterestModel {
  int? id;
  String? interestName;
  String? iconPath;

  InterestModel({
    this.id,
    this.interestName,
    this.iconPath,
  });

  @override
  String toString() {
    return '{id: $id, interest_name: $interestName, icon: $iconPath}';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'interest_name': interestName,
      'icon': iconPath,
    };
  }
}

List<InterestModel> myInterestList = [];

List<Map<String, dynamic>> encodedInterestList =
    myInterestList.map((interests) => interests.toJson()).toList();
