import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class NurseChatPage extends StatefulWidget {
  const NurseChatPage({super.key});

  @override
  NurseChatPageState createState() => NurseChatPageState();
}

class NurseChatPageState extends State<NurseChatPage> {
  List<Map<String, dynamic>> messages = [
    {'text': 'Hello! How are you feeling today?', 'isMe': false},
    {'text': 'I’m feeling a bit dizzy.', 'isMe': true},
    {'text': 'Did you take your medication?', 'isMe': false},
    {'text': 'Yes, I took it at 9 AM.', 'isMe': true},
  ];

  final TextEditingController _controller = TextEditingController();

  void sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        messages.add({'text': text, 'isMe': true});
        _confettiController.play();
      });
      _controller.clear();
    }
  }
late ConfettiController _confettiController;

@override
void initState() {
  super.initState();
  _confettiController = ConfettiController(duration: const Duration(seconds: 2));
}

@override
void dispose() {
  _confettiController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(child: Text("A")),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nurse Ahmed", style: TextStyle(fontSize: 16)),
                Text("Online", style: TextStyle(fontSize: 12)),
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
              Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        confettiController: _confettiController,
        blastDirection: 3.14 / 2, // downward
        emissionFrequency: 0.05,
        numberOfParticles: 30,
        maxBlastForce: 20,
        minBlastForce: 5,
        gravity: 0.3,
        shouldLoop: false,
        colors: const [Colors.blue, Colors.green, Colors.pink, Colors.orange, Colors.purple],
      ),
    ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return Align(
                  alignment: msg['isMe'] ?
                  //  Alignment.centerLeft : Alignment.centerRight,
                  Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                    decoration: BoxDecoration(
                      color: msg['isMe'] ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(msg['isMe'] ? 12 : 0),
                        bottomRight: Radius.circular(msg['isMe'] ? 0 : 12),
                      ),
                    ),
                    child: Text(msg['text']),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            color: Colors.grey[300],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: sendMessage,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

