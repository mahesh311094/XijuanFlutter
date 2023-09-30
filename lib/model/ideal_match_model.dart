class IdealMatchModel {
  int? id;
  String? idealMatchName;

  IdealMatchModel({
    this.id,
    this.idealMatchName,
  });

  @override
  String toString() {
    return '{id: $id, ideal_match_name: $idealMatchName}';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ideal_match_name': idealMatchName,
    };
  }
}

List<IdealMatchModel> idealMatchList = [];

List<Map<String, dynamic>> encodedIdealMatchList =
    idealMatchList.map((matches) => matches.toJson()).toList();