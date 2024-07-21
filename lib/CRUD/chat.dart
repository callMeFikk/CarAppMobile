import 'package:cloud_firestore/cloud_firestore.dart';

class ChatItem {
  String id;
  final String name;
  final String message;
  final String time;
  final bool isRead;
  final String photoImages;

  ChatItem(this.id, this.name, this.message, this.time, this.isRead, {required this.photoImages});

  factory ChatItem.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ChatItem(
      doc.id,
      data['name'] ?? '',
      data['message'] ?? '',
      data['time'] ?? '',
      data['isRead'] ?? false,
      photoImages: data['photoImages'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'message': message,
      'time': time,
      'isRead': isRead,
      'photoImages': photoImages,
    };
  }
}
