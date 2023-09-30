class UserProfileResModel {
  UserProfile? userProfile;
  Country? country;
  List<InterestType>? interestType;
  List<IdealMatch>? idealMatch;
  Gender? gender;
  List<InterestedGender>? interestedGender;
  List<FluentLanguageType>? fluentLanguageType;
  Zodiac? zodiac;
  ChineseZodiac? chineseZodiac;
  SmokeDurationType? smokeDurationType;
  WorkoutDurationType? workoutDurationType;
  AlcoholDrinkDurationType? alcoholDrinkDurationType;
  IdentifyWith? identifyWith;
  Religion? religion;
  ToHaveChildren? toHaveChildren;
  EducationalDegree? educationalDegree;
  List<UserPhotos>? userPhotos;

  UserProfileResModel({
    this.userProfile,
    this.country,
    this.interestType,
    this.idealMatch,
    this.gender,
    this.interestedGender,
    this.fluentLanguageType,
    this.zodiac,
    this.chineseZodiac,
    this.smokeDurationType,
    this.workoutDurationType,
    this.alcoholDrinkDurationType,
    this.identifyWith,
    this.religion,
    this.toHaveChildren,
    this.educationalDegree,
    this.userPhotos,
  });

  UserProfileResModel.fromJson(Map<String, dynamic> json) {
    userProfile = json['user_profile'] == null
        ? null
        : UserProfile.fromJson(json['user_profile']);
    country =
        json['country'] == null ? null : Country.fromJson(json['country']);
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
    gender = json['gender'] == null ? null : Gender.fromJson(json['gender']);
    interestedGender = List<InterestedGender>.from(
      json["interested_gender"].map(
        (x) => InterestedGender.fromJson(x),
      ),
    );
    fluentLanguageType = List<FluentLanguageType>.from(
      json["fluent_language_type"].map(
        (x) => FluentLanguageType.fromJson(x),
      ),
    );
    zodiac = json['zodiac'] == null ? null : Zodiac.fromJson(json['zodiac']);
    chineseZodiac = json['chinese_zodiac'] == null
        ? null
        : ChineseZodiac.fromJson(json['chinese_zodiac']);
    smokeDurationType = json['smoke_duration_type'] == null
        ? null
        : SmokeDurationType.fromJson(json['smoke_duration_type']);
    workoutDurationType = json['workout_duration_type'] == null
        ? null
        : WorkoutDurationType.fromJson(json['workout_duration_type']);
    alcoholDrinkDurationType = json['alcohol_drink_duration_type'] == null
        ? null
        : AlcoholDrinkDurationType.fromJson(
            json['alcohol_drink_duration_type']);
    identifyWith = json['identify_with'] == null
        ? null
        : IdentifyWith.fromJson(json['identify_with']);
    religion =
        json['religion'] == null ? null : Religion.fromJson(json['religion']);
    toHaveChildren = json['to_have_children'] == null
        ? null
        : ToHaveChildren.fromJson(json['to_have_children']);
    educationalDegree = json['educational_degree'] == null
        ? null
        : EducationalDegree.fromJson(json['educational_degree']);
    userPhotos = List<UserPhotos>.from(
      json["user_photos"].map(
        (x) => UserPhotos.fromJson(x),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_profile'] = userProfile?.toJson();
    data['country'] = country?.toJson();
    data['interest_type'] = interestType?.map((e) => e.toJson()).toList();
    data['ideal_match'] = idealMatch?.map((e) => e.toJson()).toList();
    data['gender'] = gender?.toJson();
    data['interested_gender'] =
        interestedGender?.map((e) => e.toJson()).toList();
    data['fluent_language_type'] =
        fluentLanguageType?.map((e) => e.toJson()).toList();
    data['zodiac'] = zodiac?.toJson();
    data['chinese_zodiac'] = chineseZodiac?.toJson();
    data['smoke_duration_type'] = smokeDurationType?.toJson();
    data['workout_duration_type'] = workoutDurationType?.toJson();
    data['alcohol_drink_duration_type'] = alcoholDrinkDurationType?.toJson();
    data['identify_with'] = identifyWith?.toJson();
    data['religion'] = religion?.toJson();
    data['to_have_children'] = toHaveChildren?.toJson();
    data['educational_degree'] = educationalDegree?.toJson();
    data['user_photos'] = userPhotos?.map((e) => e.toJson()).toList();
    return data;
  }
}

class UserProfile {
  UserProfile({
    this.userId,
    this.firstName,
    this.lastName,
    this.countryCellCode,
    this.mobile,
    this.email,
    this.profilePic,
    this.aboutMe,
    this.dateOfBirth,
    this.height,
    this.occupation,
    this.year,
    required this.lastLatitude,
    required this.lastLongitude,
  });

  String? userId;
  String? firstName;
  String? lastName;
  String? countryCellCode;
  String? mobile;
  String? email;
  String? profilePic;
  String? aboutMe;
  String? dateOfBirth;
  String? height;
  String? occupation;
  int? year;
  var lastLatitude;
  var lastLongitude;

  UserProfile.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    countryCellCode = json['country_cell_code'];
    mobile = json['mobile'];
    email = json['email'];
    profilePic = json['profile_pic'];
    aboutMe = json['about_me'];
    dateOfBirth = json['date_of_birth'];
    height = json['height'];
    occupation = json['occupation'];
    year = json['year'];
    lastLatitude = json['last_latitude'];
    lastLongitude = json['last_longitude'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['country_cell_code'] = countryCellCode;
    data['mobile'] = mobile;
    data['email'] = email;
    data['profile_pic'] = profilePic;
    data['about_me'] = aboutMe;
    data['date_of_birth'] = dateOfBirth;
    data['height'] = height;
    data['occupation'] = occupation;
    data['year'] = year;
    data['last_latitude'] = lastLatitude;
    data['last_longitude'] = lastLongitude;
    return data;
  }
}

class Country {
  Country({
    this.id,
    this.countryName,
    this.countryCode,
    this.countryImage,
  });

  int? id;
  String? countryName;
  String? countryCode;
  String? countryImage;

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryName = json['country_name'];
    countryCode = json['country_code'];
    countryImage = json['country_image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['country_name'] = countryName;
    data['country_code'] = countryCode;
    data['country_image'] = countryImage;
    return data;
  }
}

class InterestType {
  InterestType({
    this.id,
    this.interestName,
    this.icon,
  });

  int? id;
  String? interestName;
  String? icon;

  InterestType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    interestName = json['interest_name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['interest_name'] = interestName;
    data['icon'] = icon;
    return data;
  }
}

class IdealMatch {
  IdealMatch({
    this.id,
    this.idealMatchName,
  });

  int? id;
  String? idealMatchName;

  IdealMatch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idealMatchName = json['ideal_match_name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['ideal_match_name'] = idealMatchName;
    return data;
  }
}

class Gender {
  Gender({
    this.id,
    this.gender,
  });

  int? id;
  String? gender;

  Gender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['gender'] = gender;
    return data;
  }
}

class InterestedGender {
  InterestedGender({
    this.id,
    this.gender,
  });

  int? id;
  String? gender;

  InterestedGender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['gender'] = gender;
    return data;
  }
}

class FluentLanguageType {
  FluentLanguageType({
    this.id,
    this.fluentLanguageType,
  });

  int? id;
  String? fluentLanguageType;

  FluentLanguageType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fluentLanguageType = json['fluent_language_type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['fluent_language_type'] = fluentLanguageType;
    return data;
  }
}

class Zodiac {
  Zodiac({
    this.id,
    this.zodiacName,
  });

  int? id;
  String? zodiacName;

  Zodiac.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    zodiacName = json['zodiac_name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['zodiac_name'] = zodiacName;
    return data;
  }
}

class ChineseZodiac {
  ChineseZodiac({
    this.id,
    this.chineseZodiacName,
  });

  int? id;
  String? chineseZodiacName;

  ChineseZodiac.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chineseZodiacName = json['chinese_zodiac_name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['chinese_zodiac_name'] = chineseZodiacName;
    return data;
  }
}

class SmokeDurationType {
  SmokeDurationType({
    this.id,
    this.smokeDurationType,
  });

  int? id;
  String? smokeDurationType;

  SmokeDurationType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    smokeDurationType = json['smoke_duration_type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['smoke_duration_type'] = smokeDurationType;
    return data;
  }
}

class WorkoutDurationType {
  WorkoutDurationType({
    this.id,
    this.workoutDurationType,
  });

  int? id;
  String? workoutDurationType;

  WorkoutDurationType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    workoutDurationType = json['workout_duration_type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['workout_duration_type'] = workoutDurationType;
    return data;
  }
}

class AlcoholDrinkDurationType {
  AlcoholDrinkDurationType({
    this.id,
    this.alcoholDrinkDurationType,
  });

  int? id;
  String? alcoholDrinkDurationType;

  AlcoholDrinkDurationType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alcoholDrinkDurationType = json['alcohol_drink_duration_type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['alcohol_drink_duration_type'] = alcoholDrinkDurationType;
    return data;
  }
}

class IdentifyWith {
  IdentifyWith({
    this.id,
    this.identifyWithName,
  });

  int? id;
  String? identifyWithName;

  IdentifyWith.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    identifyWithName = json['identify_with_name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['identify_with_name'] = identifyWithName;
    return data;
  }
}

class Religion {
  Religion({
    this.id,
    this.religionName,
  });

  int? id;
  String? religionName;

  Religion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    religionName = json['religion_name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['religion_name'] = religionName;
    return data;
  }
}

class ToHaveChildren {
  ToHaveChildren({
    this.id,
    this.childrenQueryType,
  });

  int? id;
  String? childrenQueryType;

  ToHaveChildren.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    childrenQueryType = json['children_query_type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['children_query_type'] = childrenQueryType;
    return data;
  }
}

class EducationalDegree {
  EducationalDegree({
    this.id,
    this.educationalDegree,
  });

  int? id;
  String? educationalDegree;

  EducationalDegree.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    educationalDegree = json['educational_degree'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['educational_degree'] = educationalDegree;
    return data;
  }
}

class UserPhotos {
  UserPhotos({
    this.photoId,
    this.photoName,
  });

  String? photoId;
  String? photoName;

  UserPhotos.fromJson(Map<String, dynamic> json) {
    photoId = json['photo_id'];
    photoName = json['photo_name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['photo_id'] = photoId;
    data['photo_name'] = photoName;
    return data;
  }
}
