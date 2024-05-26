import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: NotificationsPage(),
  ));
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NotificationItem> notifications = [
      NotificationItem(
        type: NotificationType.fireAlert,
        title: 'Fire Alert',
        subtitle: 'Fire detected near your location!',
        icon: Icons.fire_extinguisher,
        timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
      ),
      NotificationItem(
        type: NotificationType.newsReport,
        title: 'News Report',
        subtitle: 'Breaking news: Major accident on Lacson 9th Street',
        icon: Icons.article,
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      NotificationItem(
        type: NotificationType.weatherAlert,
        title: 'Weather Alert',
        subtitle: 'Severe thunderstorm warning in effect',
        icon: Icons.warning,
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
      ),
      NotificationItem(
        type: NotificationType.fireAlert,
        title: 'Fire Alert',
        subtitle: 'Fire reported in downtown area',
        icon: Icons.fire_extinguisher,
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      ),
    ];

    notifications.shuffle();

    return Scaffold(
      appBar: AppBar(
        title:
        const Text('Notifications', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1375E8),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          return buildNotificationCard(context, notifications[index]);
        },
      ),
    );
  }

  Widget buildNotificationCard(
      BuildContext context, NotificationItem notification) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          notification.icon,
          color: _getColorForType(notification.type),
          size: 32,
        ),
        title: Text(
          notification.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              notification.subtitle,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              _formatTimestamp(notification.timestamp),
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        onTap: () => _handleNotificationTap(context, notification),
      ),
    );
  }

  Color _getColorForType(NotificationType type) {
    switch (type) {
      case NotificationType.fireAlert:
        return Colors.red;
      case NotificationType.weatherAlert:
        return Colors.blue;
      case NotificationType.newsReport:
        return Colors.green;
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hr ago';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
  }

  void _handleNotificationTap(
      BuildContext context, NotificationItem notification) {
    // Handle notification tap here
  }
}

enum NotificationType {
  fireAlert,
  weatherAlert,
  newsReport,
}

class NotificationItem {
  final NotificationType type;
  final String title;
  final String subtitle;
  final IconData icon;
  final DateTime timestamp;

  NotificationItem({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.timestamp,
  });
}
