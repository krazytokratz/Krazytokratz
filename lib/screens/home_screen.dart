import 'package:flutter/material.dart';

import '../avatar/kraz_avatar.dart';
import '../chat/chat_controller.dart';
import '../chat/chat_message.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {
  final ChatController controller =
      ChatController();

  final TextEditingController
      inputController =
      TextEditingController();

  KrazState avatarState =
      KrazState.ready;

  bool loading = true;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    await controller.initialize();

    setState(() {
      loading = false;
    });
  }

  Future<void> send() async {
    final text =
        inputController.text.trim();

    if (text.isEmpty) {
      return;
    }

    inputController.clear();

    setState(() {
      avatarState =
          KrazState.thinking;
    });

    await controller.sendMessage(
      text,
    );

    setState(() {
      avatarState =
          KrazState.ready;
    });
  }

  Widget buildBubble(
    ChatMessage message,
  ) {
    final isUser =
        message.sender ==
            MessageSender.user;

    return Align(
      alignment: isUser
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        margin:
            const EdgeInsets.symmetric(
          vertical: 6,
        ),
        padding:
            const EdgeInsets.all(
          12,
        ),
        constraints:
            const BoxConstraints(
          maxWidth: 320,
        ),
        decoration: BoxDecoration(
          color: isUser
              ? Colors.blue
              : Colors.grey.shade300,
          borderRadius:
              BorderRadius.circular(
            16,
          ),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: isUser
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    if (loading) {
      return const Scaffold(
        body: Center(
          child:
              CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kraz AI Assistant",
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          KrazAvatar(
            state: avatarState,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              padding:
                  const EdgeInsets.all(
                16,
              ),
              itemCount:
                  controller.messages.length,
              itemBuilder:
                  (context, index) {
                return buildBubble(
                  controller
                      .messages[index],
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.all(
              16,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller:
                        inputController,
                    decoration:
                        const InputDecoration(
                      hintText:
                          "Berbicara dengan Kraz...",
                    ),
                    onSubmitted:
                        (_) => send(),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                IconButton(
                  onPressed: send,
                  icon: const Icon(
                    Icons.send,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }
}