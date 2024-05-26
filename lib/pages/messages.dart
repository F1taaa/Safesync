import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'messages_create.dart';
import 'messages_details.dart';

class MessagesPage extends StatelessWidget {
  static const List<String> _messages = [
    'Message 1',
    'Message 2',
  ];

  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> shuffledMessages = _messages.toList()..shuffle();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages', style: TextStyle(color: Colors.white), ),
        backgroundColor: Color(0xFF1375E8),
        actions: [
          IconButton(
            icon: const Icon(Icons.create), color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ComposeMessagePage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: shuffledMessages.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 1,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessageDetailsPage(
                      message: shuffledMessages[index],
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: MessageTile(message: shuffledMessages[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message;

  const MessageTile({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: const Text('Sender Name'),
      subtitle: Text(
        message,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: const Text('12:00 PM'),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MessagesPage(),
  ));
}
