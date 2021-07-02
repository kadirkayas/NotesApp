import 'package:flutter/material.dart';
import 'package:scheduled_notifications/scheduled_notifications.dart';

class LocalNotification {
  LocalNotification() {
    _bildirim();
  }

  _bildirim() async {
    int notificationId = await ScheduledNotifications.scheduleNotification(
        DateTime.now().add(Duration(seconds: 1)).millisecondsSinceEpoch,
        "",
        "Bildirim Testi Başarılı!",
        "Örnek Küçük Alt Yazı.");
  }
}
