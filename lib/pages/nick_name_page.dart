import 'dart:io';

import 'package:chatdioapp/pages/chat_page.dart';
import 'package:chatdioapp/service/dark_mode_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NickNameScreen extends StatefulWidget {
  @override
  _NickNameScreenState createState() => _NickNameScreenState();
}

class _NickNameScreenState extends State<NickNameScreen> {
  final TextEditingController _nickNameController = TextEditingController();
  String? _selectedTopic;
  bool _isLoading = false;

  Future<void> _login() async {
    if (_selectedTopic == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Escolha um assunto para o chat!')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });
    try {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(
            nickName: _nickNameController.text,
            sala: _selectedTopic!,
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao entrar no chat: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 60, 65, 212),
        title: const Text('DIO Chat - NickName'),
        actions: [
          const Center(
            child: Text(
              'Dark Mode',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Consumer<DarkModeService>(
            builder: (_, darkmModeService, Widget) {
              return Switch(
                  value: darkmModeService.isDarkMode,
                  onChanged: (bool value) {
                    darkmModeService.changeTheme();
                  });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height:
                      40), // Espaço extra para garantir que o logo fique visível
              Image.asset(
                "lib/images/logo_app.png",
                height: 200,
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _nickNameController,
                decoration:
                    InputDecoration(labelText: 'Entre com seu nickname'),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20.0),
              Text('Escolha um assunto:'),
              DropdownButton<String>(
                value: _selectedTopic,
                items: ['Programação', 'Inteligência Artificial', 'Inovação']
                    .map((topic) {
                  return DropdownMenuItem(
                    value: topic,
                    child: Text(topic),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedTopic = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      child: Text('Entrar'),
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          exit(0); // Fecha o app diretamente
        },
        child: Icon(Icons.exit_to_app),
        tooltip: 'Sair',
      ),
    );
  }
}
