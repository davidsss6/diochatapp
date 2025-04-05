# 💬 DIO Chat App

Um aplicativo de chat em tempo real criado como parte de um desafio do curso de Flutter, integrando autenticação local, envio de mensagens de texto e imagem, e sincronização com o Firebase.

---

## 🚀 Tecnologias Utilizadas

- 📱 **Flutter** – Framework principal para desenvolvimento do app
- 🔥 **Firebase Firestore** – Banco de dados em tempo real
- 📦 **Firebase Core** – Inicialização e configuração do Firebase
- 🌐 **Flutter DotEnv** – Gerenciamento de variáveis de ambiente
- 📷 **Image Picker** – Seleção de imagens da galeria
- 🧠 **Provider** – Gerenciamento de estado do tema (modo claro/escuro)
- 💾 **Shared Preferences** – Armazenamento local do ID do usuário

---

## 🧩 Estrutura de Pastas

```
lib/
├── models/
│   └── text_model.dart
├── pages/
│   ├── chat_page.dart
│   └── nick_name_page.dart
├── shared/
│   └── widgets/
│       └── chat_widget.dart
├── service/
│   └── dark_mode_service.dart
├── images/
│   └── logo_app.png
├── firebase_options.dart
├── my_app.dart
└── main.dart
```

---

## 🛠️ Funcionalidades

- 🧑 Definição de nickname
- 💡 Seleção de assunto da sala (Programação, IA, Inovação)
- 🌓 Alternância entre temas claro e escuro
- 💬 Envio de mensagens de texto em tempo real
- 🖼️ Envio e visualização de imagens (via galeria)
- 🧠 Identificação de mensagens enviadas pelo próprio usuário

---

## ⚙️ Como rodar o projeto localmente

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/dio-chat-app.git
```

2. Instale os pacotes:
```bash
flutter pub get
```

3. Adicione seu arquivo `.env` na raiz do projeto com suas chaves Firebase:
```env
API_KEY=...
PROJECT_ID=...
...
```

4. Execute o projeto:
```bash
flutter run
```

---

## 📸 Imagens do App

> *Capturas de tela incluídas separadamente*

---

## 👨‍💻 Autor

Desenvolvido por **Davidson** no curso de Flutter da **DIO** 🚀

Se curtiu ou quer sugerir melhorias, fique à vontade para contribuir! 😄

