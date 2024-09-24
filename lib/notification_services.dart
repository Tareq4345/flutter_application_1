import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showImageNotification(List<String> imageUrl) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'full_screen_channel',
      'Full Screen Notifications',
       channelDescription: 'Channel for image notifications',
       importance: Importance.max,
       priority: Priority.high,
       fullScreenIntent: true,
       visibility: NotificationVisibility.public,
       styleInformation: BigPictureStyleInformation(
         DrawableResourceAndroidBitmap('@mipmap/ic_launcher'), // Replace with your icon
         contentTitle: 'Image Notification',
         summaryText: 'Tap to view the image',
         hideExpandedLargeIcon: true,
      ),
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'New Image!',
      'Tap to view the image',
      platformChannelSpecifics,
      payload: imageUrl[0],
    );
  }
}
