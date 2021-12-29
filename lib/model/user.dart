class AutoGenerate {
  AutoGenerate({
    required this.token,
    required this.user,
    required this.client,
  });
  late final String token;
  late final User user;
  late final Client client;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = User.fromJson(json['user']);
    client = Client.fromJson(json['client']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['user'] = user.toJson();
    _data['client'] = client.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.userRole,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.activatedAt,
    required this.createdAt,
    required this.updatedAt,
    this.phoneNumber,
    required this.measurementUnit,
    required this.language,
    required this.country,
  });
  late final int id;
  late final UserRole userRole;
  late final String email;
  late final String firstName;
  late final String lastName;
  late final String activatedAt;
  late final String createdAt;
  late final String updatedAt;
  late final Null phoneNumber;
  late final String measurementUnit;
  late final String language;
  late final String country;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userRole = UserRole.fromJson(json['userRole']);
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    activatedAt = json['activatedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    phoneNumber = null;
    measurementUnit = json['measurementUnit'];
    language = json['language'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['userRole'] = userRole.toJson();
    _data['email'] = email;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['activatedAt'] = activatedAt;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['phoneNumber'] = phoneNumber;
    _data['measurementUnit'] = measurementUnit;
    _data['language'] = language;
    _data['country'] = country;
    return _data;
  }
}

class UserRole {
  UserRole({
    required this.id,
    required this.isAdministrator,
    required this.name,
    this.clientId,
  });
  late final int id;
  late final bool isAdministrator;
  late final String name;
  late final Null clientId;

  UserRole.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isAdministrator = json['isAdministrator'];
    name = json['name'];
    clientId = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['isAdministrator'] = isAdministrator;
    _data['name'] = name;
    _data['clientId'] = clientId;
    return _data;
  }
}

class Client {
  Client({
    required this.id,
    required this.key,
    required this.name,
    this.logo,
    required this.companyName,
    this.companyAddress,
    this.companyPhoneNumber,
    this.companyEmail,
    required this.companyTaxNumber,
    required this.companyDefaultTaxRate,
    this.notificationsEmail,
    required this.isTest,
  });
  late final int id;
  late final String key;
  late final String name;
  late final logo;
  late final String companyName;
  late final companyAddress;
  late final companyPhoneNumber;
  late final companyEmail;
  late final String companyTaxNumber;
  late final double companyDefaultTaxRate;
  late final notificationsEmail;
  late final bool isTest;

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
    logo = null;
    companyName = json['companyName'];
    companyAddress = null;
    companyPhoneNumber = null;
    companyEmail = null;
    companyTaxNumber = json['companyTaxNumber'];
    companyDefaultTaxRate = json['companyDefaultTaxRate'];
    notificationsEmail = null;
    isTest = json['isTest'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['key'] = key;
    _data['name'] = name;
    _data['logo'] = logo;
    _data['companyName'] = companyName;
    _data['companyAddress'] = companyAddress;
    _data['companyPhoneNumber'] = companyPhoneNumber;
    _data['companyEmail'] = companyEmail;
    _data['companyTaxNumber'] = companyTaxNumber;
    _data['companyDefaultTaxRate'] = companyDefaultTaxRate;
    _data['notificationsEmail'] = notificationsEmail;
    _data['isTest'] = isTest;
    return _data;
  }
}
