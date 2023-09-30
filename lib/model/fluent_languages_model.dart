class FluentLanguageModel {
  int? id;
  String? fluentLanguageType;

  FluentLanguageModel({
    this.id,
    this.fluentLanguageType,
  });

  @override
  String toString() {
    return '{id: $id, fluent_language_type: $fluentLanguageType}';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fluent_language_type': fluentLanguageType,
    };
  }
}

List<FluentLanguageModel> fluentLanguageList = [];

List<Map<String, dynamic>> encodedFluentLanguageList =
    fluentLanguageList.map((lang) => lang.toJson()).toList();
