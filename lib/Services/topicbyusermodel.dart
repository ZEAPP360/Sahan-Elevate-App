class TopicsBySubjects {
  bool? success;
  List<Data>? data;
  String? message;

  TopicsBySubjects({this.success, this.data, this.message});

  TopicsBySubjects.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  String? subjectId;
  String? moduleId;
  String? status;
  Null? rememberToken;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.description,
      this.subjectId,
      this.moduleId,
      this.status,
      this.rememberToken,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    subjectId = json['subject_id'];
    moduleId = json['module_id'];
    status = json['status'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['subject_id'] = this.subjectId;
    data['module_id'] = this.moduleId;
    data['status'] = this.status;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
