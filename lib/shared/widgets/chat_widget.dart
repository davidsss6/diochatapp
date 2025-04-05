import 'dart:io';
import 'package:chatdioapp/models/text_model.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final TextModel textModel;
  final bool souEu;
  final bool isLocalImage;

  const ChatWidget({
    super.key,
    required this.textModel,
    required this.souEu,
    this.isLocalImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: souEu ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: souEu ? Colors.blue : Colors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textModel.nickname,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            textModel.isImage
                ? Container(
                    width: 200,
                    height: 200,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: isLocalImage
                        ? Image.file(File(textModel.text), fit: BoxFit.cover)
                        : Image.network(textModel.text, fit: BoxFit.cover),
                  )
                : Text(
                    textModel.text,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
          ],
        ),
      ),
    );
  }
}
