import 'package:get/get.dart';

class AppInitialModel {
  List<Country>? country;
  List<InterestType>? interestType;
  List<IdealMatch>? idealMatch;
  List<Gender>? gender;
  List<Zodiac>? zodiac;
  List<ChineseZodiac>? chineseZodiac;
  List<SmokeDurationType>? smokeDurationType;
  List<WorkoutDurationType>? workoutDurationType;
  List<AlcoholDrinkDurationType>? alcoholDrinkDurationType;
  List<IdentifyWith>? identifyWith;
  List<FluentLanguageType>? fluentLanguageType;
  List<Religion>? religion;
  List<ToHaveChildren>? toHaveChildren;
  List<EducationalDegree>? educationalDegree;

  AppInitialModel({
    this.country,
    this.interestType,
    this.idealMatch,
    this.gender,
    this.zodiac,
    this.chineseZodiac,
    this.smokeDurationType,
    this.workoutDurationType,
    this.alcoholDrinkDurationType,
    this.identifyWith,
    this.fluentLanguageType,
    this.religion,
    this.toHaveChildren,
    this.educationalDegree,
  });

  AppInitialModel.fromJson(Map<String, dynamic> json) {
    country = List<Country>.from(
      json["country"].map(
        (x) => Country.fromJson(x),
      ),
    );
    interestType = List<InterestType>.from(
      json["interest_type"].map(
        (x) => InterestType.fromJson(x),
      ),
    );
    idealMatch = List<IdealMatch>.from(
      json["ideal_match"].map(
        (x) => IdealMatch.fromJson(x),
      ),
    );
    gender = List<Gender>.from(
      json["gender"].map(
        (x) => Gender.fromJson(x),
      ),
    );
    zodiac = List<Zodiac>.from(
      json["zodiac"].map(
        (x) => Zodiac.fromJson(x),
      ),
    );
    chineseZodiac = List<ChineseZodiac>.from(
      json["chinese_zodiac"].map(
        (x) => ChineseZodiac.fromJson(x),
      ),
    );
    smokeDurationType = List<SmokeDurationType>.from(
      json["smoke_duration_type"].map(
        (x) => SmokeDurationType.fromJson(x),
      ),
    );
    workoutDurationType = List<WorkoutDurationType>.from(
      json["workout_duration_type"].map(
        (x) => WorkoutDurationType.fromJson(x),
      ),
    );
    alcoholDrinkDurationType = List<AlcoholDrinkDurationType>.from(
      json["alcohol_drink_duration_type"].map(
        (x) => AlcoholDrinkDurationType.fromJson(x),
      ),
    );
    identifyWith = List<IdentifyWith>.from(
      json["identify_with"].map(
        (x) => IdentifyWith.fromJson(x),
      ),
    );
    fluentLanguageType = List<FluentLanguageType>.from(
      json["fluent_language_type"].map(
        (x) => FluentLanguageType.fromJson(x),
      ),
    );
    religion = List<Religion>.from(
      json["religion"].map(
        (x) => Religion.fromJson(x),
      ),
    );
    toHaveChildren = List<ToHaveChildren>.from(
      json["to_have_children"].map(
        (x) => ToHaveChildren.fromJson(x),
      ),
    );
    educationalDegree = List<EducationalDegree>.from(
      json["educational_degree"].map(
        (x) => EducationalDegree.fromJson(x),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (country != null) {
      data['country'] = country!.map((v) => v.toJson()).toList();
    }
    if (interestType != null) {
      data['interest_type'] = interestType!.map((v) => v.toJson()).toList();
    }
    if (idealMatch != null) {
      data['ideal_match'] = idealMatch!.map((v) => v.toJson()).toList();
    }
    if (gender != null) {
      data['gender'] = gender!.map((v) => v.toJson()).toList();
    }
    if (zodiac != null) {
      data['zodiac'] = zodiac!.map((v) => v.toJson()).toList();
    }
    if (chineseZodiac != null) {
      data['chinese_zodiac'] = chineseZodiac!.map((v) => v.toJson()).toList();
    }
    if (smokeDurationType != null) {
      data['smoke_duration_type'] =
          smokeDurationType!.map((v) => v.toJson()).toList();
    }
    if (workoutDurationType != null) {
      data['workout_duration_type'] =
          workoutDurationType!.map((v) => v.toJson()).toList();
    }
    if (alcoholDrinkDurationType != null) {
      data['alcohol_drink_duration_type'] =
          alcoholDrinkDurationType!.map((v) => v.toJson()).toList();
    }
    if (identifyWith != null) {
      data['identify_with'] = identifyWith!.map((v) => v.toJson()).toList();
    }
    if (fluentLanguageType != null) {
      data['fluent_language_type'] =
          fluentLanguageType!.map((v) => v.toJson()).toList();
    }
    if (religion != null) {
      data['religion'] = religion!.map((v) => v.toJson()).toList();
    }
    if (toHaveChildren != null) {
      data['to_have_children'] =
          toHaveChildren!.map((v) => v.toJson()).toList();
    }
    if (educationalDegree != null) {
      data['educational_degree'] =
          educationalDegree!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Country {
  int? id;
  String? countryName;
  String? countryCode;
  String? countryImage;

  Country({this.id, this.countryName, this.countryCode, this.countryImage});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryName = json['country_name'];
    countryCode = json['country_code'];
    countryImage = json['country_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['country_name'] = countryName;
    data['country_code'] = countryCode;
    data['country_image'] = countryImage;
    return data;
  }
}

class InterestType {
  int? id;
  String? interestName;
  String? icon;
  RxBool isSelected = false.obs;

  InterestType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    interestName = json['interest_name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['interest_name'] = interestName;
    data['icon'] = icon;
    return data;
  }
}

class IdealMatch {
  int? id;
  String? idealMatchName;
  RxBool isSelected = false.obs;

  IdealMatch({this.id, this.idealMatchName});

  IdealMatch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idealMatchName = json['ideal_match_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ideal_match_name'] = idealMatchName;
    return data;
  }
}

class Gender {
  int? id;
  String? gender;
  RxBool isSelected = false.obs;

  Gender({this.id, this.gender});

  Gender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gender'] = gender;
    return data;
  }
}

class Zodiac {
  int? id;
  String? zodiacName;

  Zodiac({this.id, this.zodiacName});

  Zodiac.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    zodiacName = json['zodiac_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['zodiac_name'] = zodiacName;
    return data;
  }
}

class ChineseZodiac {
  int? id;
  String? chineseZodiacName;

  ChineseZodiac({this.id, this.chineseZodiacName});

  ChineseZodiac.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chineseZodiacName = json['chinese_zodiac_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['chinese_zodiac_name'] = chineseZodiacName;
    return data;
  }
}

class SmokeDurationType {
  int? id;
  String? smokeDurationType;

  SmokeDurationType({this.id, this.smokeDurationType});

  SmokeDurationType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    smokeDurationType = json['smoke_duration_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['smoke_duration_type'] = smokeDurationType;
    return data;
  }
}

class WorkoutDurationType {
  int? id;
  String? workoutDurationType;

  WorkoutDurationType({this.id, this.workoutDurationType});

  WorkoutDurationType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    workoutDurationType = json['workout_duration_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['workout_duration_type'] = workoutDurationType;
    return data;
  }
}

class AlcoholDrinkDurationType {
  int? id;
  String? alcoholDrinkDurationType;

  AlcoholDrinkDurationType({this.id, this.alcoholDrinkDurationType});

  AlcoholDrinkDurationType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alcoholDrinkDurationType = json['alcohol_drink_duration_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['alcohol_drink_duration_type'] = alcoholDrinkDurationType;
    return data;
  }
}

class IdentifyWith {
  int? id;
  String? identifyWithName;

  IdentifyWith({this.id, this.identifyWithName});

  IdentifyWith.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    identifyWithName = json['identify_with_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['identify_with_name'] = identifyWithName;
    return data;
  }
}

class FluentLanguageType {
  int? id;
  String? fluentLanguageType;
  RxBool isSelected = false.obs;

  FluentLanguageType({this.id, this.fluentLanguageType});

  FluentLanguageType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fluentLanguageType = json['fluent_language_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fluent_language_type'] = fluentLanguageType;
    return data;
  }
}

class Religion {
  int? id;
  String? religionName;

  Religion({this.id, this.religionName});

  Religion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    religionName = json['religion_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['religion_name'] = religionName;
    return data;
  }
}

class ToHaveChildren {
  int? id;
  String? childrenQueryType;

  ToHaveChildren({this.id, this.childrenQueryType});

  ToHaveChildren.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    childrenQueryType = json['children_query_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['children_query_type'] = childrenQueryType;
    return data;
  }
}

class EducationalDegree {
  int? id;
  String? educationalDegree;

  EducationalDegree({this.id, this.educationalDegree});

  EducationalDegree.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    educationalDegree = json['educational_degree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['educational_degree'] = educationalDegree;
    return data;
  }
}
