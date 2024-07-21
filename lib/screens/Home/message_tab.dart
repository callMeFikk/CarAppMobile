import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_mobile/CRUD/chat.dart';
import 'package:flutter/material.dart';

class MessageTab extends StatefulWidget {
  const MessageTab({Key? key}) : super(key: key);

  @override
  _MessageTabState createState() => _MessageTabState();
}

class _MessageTabState extends State<MessageTab> {
  List<ChatItem> chatItems = [];
  List<ChatItem> filteredChatItems = [];

  @override
  void initState() {
    super.initState();
    _fetchChats();
  }

  void _fetchChats() async {
    FirebaseFirestore.instance
        .collection('chats')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        chatItems =
            snapshot.docs.map((doc) => ChatItem.fromFirestore(doc)).toList();
        filteredChatItems = chatItems;
      });
    });
  }

  void _addChat(ChatItem chatItem) {
    FirebaseFirestore.instance.collection('chats').add(chatItem.toFirestore());
  }

  void _updateChat(ChatItem chatItem) {
    FirebaseFirestore.instance
        .collection('chats')
        .doc(chatItem.id)
        .update(chatItem.toFirestore());
  }

  void _deleteChat(ChatItem chatItem) {
    FirebaseFirestore.instance.collection('chats').doc(chatItem.id).delete();
  }

  void _filterChats(String query) {
    final lowerCaseQuery = query.toLowerCase();
    setState(() {
      filteredChatItems = chatItems.where((chatItem) {
        final nameLower = chatItem.name.toLowerCase();
        final messageLower = chatItem.message.toLowerCase();
        return nameLower.contains(lowerCaseQuery) ||
            messageLower.contains(lowerCaseQuery);
      }).toList();
    });
  }

  void _handleChatItemTap(ChatItem chatItem) {
    _showChatDialog(chatItem: chatItem);
  }

  void _showChatDialog({ChatItem? chatItem}) {
    final isNew = chatItem == null;
    final nameController = TextEditingController(text: chatItem?.name ?? '');
    final messageController =
        TextEditingController(text: chatItem?.message ?? '');
    final timeController = TextEditingController(text: chatItem?.time ?? '');
    final isReadController =
        TextEditingController(text: chatItem?.isRead.toString() ?? 'false');
    final photoImagesController =
        TextEditingController(text: chatItem?.photoImages ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isNew ? 'Add Chat' : 'Edit Chat'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: messageController,
                decoration: InputDecoration(labelText: 'Message'),
              ),
              TextField(
                controller: timeController,
                decoration: InputDecoration(labelText: 'Time'),
              ),
              TextField(
                controller: isReadController,
                decoration: InputDecoration(labelText: 'Is Read'),
              ),
              TextField(
                controller: photoImagesController,
                decoration: InputDecoration(labelText: 'Photo Image'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final newChatItem = ChatItem(
                  chatItem?.id ?? '',
                  nameController.text,
                  messageController.text,
                  timeController.text,
                  isReadController.text == 'true',
                  photoImages: photoImagesController.text,
                );
                if (isNew) {
                  _addChat(newChatItem);
                } else {
                  _updateChat(newChatItem);
                }
                Navigator.of(context).pop();
              },
              child: Text(isNew ? 'Add' : 'Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showChatDialog(),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: _filterChats,
                decoration: InputDecoration(
                  hintText: 'Search your chats and messages',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredChatItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _handleChatItemTap(filteredChatItems[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: ChatListItem(
                        filteredChatItems[index],
                        onDelete: () => _deleteChat(filteredChatItems[index]),
                        onEdit: () =>
                            _showChatDialog(chatItem: filteredChatItems[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final ChatItem chatItem;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  ChatListItem(this.chatItem, {required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: AssetImage(chatItem.photoImages),
          radius: 20.0,
        ),
        title: Text(chatItem.name),
        subtitle: Text(chatItem.message),
        trailing: Container(
          width: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(chatItem.time),
              if (chatItem.isRead)
                const Icon(Icons.done_all, color: Colors.blue, size: 16),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, size: 20),
                      onPressed: onEdit,
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, size: 20),
                      onPressed: onDelete,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          // Handle tap event here if necessary
        },
      ),
    );
  }
}
