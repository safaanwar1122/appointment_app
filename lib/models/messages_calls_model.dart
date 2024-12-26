class Call{
 late final String title;
  late final String doctorImagePath;
  late final String audioCallPath;
  late final String videoCallPath;
  Call({
   required this.title,
    required this.doctorImagePath,
    required this.audioCallPath,
    required this.videoCallPath,
});
}

class Message{
 late final String title;
 late final String chat;
 late final String date;
  late final String image;
 Message({
   required this.title,
   required this.chat,
   required this.image,
   required this.date,
});
}