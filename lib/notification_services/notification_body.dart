enum NotificationType {
  message,
  table,
  general,
}

class NotificationBody {
  String? message;
  String? title;
  String? isBackground;
  String? image;
  String? noturl;
  String? timestamp;
  String? post;
  String? extra;

  NotificationBody(
      {this.message,
      this.title,
      this.isBackground,
      this.image,
      this.noturl,
      this.timestamp,
      this.post,
      this.extra,
      required});

  NotificationBody.fromJson(Map<String, dynamic> json) {
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["is_background"] is String) {
      isBackground = json["is_background"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["noturl"] is String) {
      noturl = json["noturl"];
    }
    if (json["timestamp"] is String) {
      timestamp = json["timestamp"];
    }
    if (json["post"] is String) {
      post = json["post"];
    }
    if (json["extra"] is String) {
      extra = json["extra"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    data["title"] = title;
    data["is_background"] = isBackground;
    data["image"] = image;
    data["noturl"] = noturl;
    data["timestamp"] = timestamp;
    data["post"] = post;
    data["extra"] = extra;
    return data;
  }

  NotificationType convertToEnum(String? enumString) {
    if (enumString == NotificationType.general.toString()) {
      return NotificationType.general;
    } else if (enumString == NotificationType.table.toString()) {
      return NotificationType.table;
    } else if (enumString == NotificationType.message.toString()) {
      return NotificationType.message;
    }
    return NotificationType.general;
  }
}
