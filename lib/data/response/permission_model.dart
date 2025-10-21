class PermissionModel {
  bool? isAppAdmin;

  PermissionModel({
    this.isAppAdmin,
  });

  PermissionModel.fromJson(Map<String, dynamic> json) {
    isAppAdmin = json['is_app_admin'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_app_admin'] = isAppAdmin;
    return data;
  }
}
