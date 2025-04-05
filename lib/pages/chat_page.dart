import 'dart:io';
import 'package:chatdioapp/models/text_model.dart';
import 'package:chatdioapp/shared/widgets/chat_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatefulWidget {
  final String nickName;
  final String sala;
  const ChatPage({super.key, required this.nickName, required this.sala});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final db = FirebaseFirestore.instance;
  final textoController = TextEditingController(text: '');
  String userId = "";
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    carregarUsuario();
  }

  carregarUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('user_id')!;
    setState(() {});
  }

  Future<void> _sendMessage({String? imagePath}) async {
    var textModel = TextModel(
      nickname: widget.nickName,
      text: imagePath ?? textoController.text,
      userId: userId,
      isImage: imagePath != null,
    );
    await db.collection(widget.sala).add(textModel.toJson());
    textoController.text = '';
  }

  Future<void> _sendImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _sendMessage(imagePath: image.path); // Envia o caminho local diretamente
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Sala: ${widget.sala}")),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: db.collection(widget.sala).snapshots(),
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? CircularProgressIndicator()
                      : ListView(
                          children: snapshot.data!.docs.map((e) {
                            var textModel = TextModel.fromJson((e.data() as Map<String, dynamic>));
                            return ChatWidget(
                              textModel: textModel,
                              souEu: textModel.userId == userId,
                              isLocalImage: textModel.isImage,
                            );
                          }).toList(),
                        );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.image),
                    onPressed: _sendImage,
                  ),
                  Expanded(
                    child: TextField(
                      controller: textoController,
                      decoration: const InputDecoration(focusedBorder: InputBorder.none),
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  IconButton(
                    onPressed: () async => _sendMessage(),
                    icon: Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
