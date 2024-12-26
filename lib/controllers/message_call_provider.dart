import 'package:appointment_app/export.dart';

import '../models/messages_calls_model.dart';

class MessageCallProvider with ChangeNotifier{
  String _selectedScreen='Messages';
  final List<Message> _messages = [
    Message(
      title: 'Dr. John Doe',
      chat: 'Lorem ipsum dolor sit amet',
      date: '03:00 PM',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. Sarah White',
      chat: 'Just checking in, how are you feeling?',
      date: '02:45 PM',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. Michael Smith',
      chat: 'Remember to take your medication!',
      date: 'Yesterday',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. Emily Davis',
      chat: 'Your test results came in. Let\'s discuss.',
      date: '12:30 PM',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. Chris Lee',
      chat: 'Everything looks good, see you next week.',
      date: '08:15 AM',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. Jennifer Taylor',
      chat: 'I need to reschedule our appointment.',
      date: 'Yesterday',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. David Wilson',
      chat: 'Please send me your symptoms.',
      date: '02:00 PM',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. Laura Evans',
      chat: 'We need to discuss your results in person.',
      date: '03:30 PM',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. James Garcia',
      chat: 'How are you feeling today?',
      date: '01:00 PM',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. Linda Martinez',
      chat: 'Let\'s go over your recovery plan.',
      date: 'Yesterday',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. William Rodriguez',
      chat: 'It seems your vitals are improving.',
      date: '05:45 PM',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. Olivia Perez',
      chat: 'I\'ve scheduled your follow-up for next week.',
      date: '08:30 AM',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. Brian Hernandez',
      chat: 'We can discuss the results when you’re available.',
      date: '03:15 PM',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. Nancy Young',
      chat: 'The prescription should be ready for pickup.',
      date: '04:00 PM',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. Steven King',
      chat: 'Don’t forget your upcoming checkup.',
      date: '06:00 PM',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. Jessica Scott',
      chat: 'Your recent tests are all clear!',
      date: '09:00 AM',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. Matthew Allen',
      chat: 'I’ve updated your treatment plan.',
      date: '03:45 PM',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. Rachel Thomas',
      chat: 'It looks like you’re progressing well.',
      date: '11:30 AM',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. Thomas Moore',
      chat: 'Let me know if you experience any issues.',
      date: '02:15 PM',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. Rebecca Jackson',
      chat: 'I will follow up on your symptoms later today.',
      date: '04:30 PM',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. Daniel White',
      chat: 'Your blood pressure looks normal.',
      date: '07:00 AM',
      image: AppImages.doctorJohn,
    ),
    Message(
      title: 'Dr. Patricia Harris',
      chat: 'I’ve sent you an updated report.',
      date: '05:30 PM',
      image: AppImages.doctorJohn,
    ),
  ];

  final List<Call> _call = [
    Call(
      title: 'Dr. Sarah Brown',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. Michael Smith',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. Emily Davis',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. Chris Lee',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. Jennifer Taylor',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. David Wilson',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. Laura Evans',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. James Garcia',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. Linda Martinez',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. William Rodriguez',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. Olivia Perez',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. Brian Hernandez',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. Nancy Young',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. Steven King',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. Jessica Scott',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. Matthew Allen',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. Rachel Thomas',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. Thomas Moore',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. Rebecca Jackson',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
    Call(
      title: 'Dr. Daniel White',
      doctorImagePath: AppImages.doctorJohn,
      audioCallPath: AppImages.voiceCall,
      videoCallPath: AppImages.videoCall,
    ),
  ];


  String get selectedScreen =>_selectedScreen;
List<Message> get messages=>_messages;
List<Call> get call=>_call;
void setSelectedScreen(String screen){
  _selectedScreen=screen;
  notifyListeners();
}
}