enum MessageOwner {
  currentUser,
  other,
}

class Message {
  final MessageOwner owner;
  final String text;

  bool get isCurrentUser => owner == MessageOwner.currentUser;

  const Message({
    required this.owner,
    required this.text,
  });
}
