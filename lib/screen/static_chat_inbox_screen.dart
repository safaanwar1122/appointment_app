import 'package:appointment_app/export.dart';

class StaticChatInboxScreen extends StatefulWidget {
  const StaticChatInboxScreen({super.key});

  @override
  State<StaticChatInboxScreen> createState() => _StaticChatInboxScreenState();
}

class _StaticChatInboxScreenState extends State<StaticChatInboxScreen> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _messageController = TextEditingController();
  final ValueNotifier<List<String >> _messages=ValueNotifier<List<String>>([]);


  @override
  void dispose() {

    _focusNode.dispose();
    _messageController
        .dispose();
    super.dispose();
  }

  void sendMessage(){
    if(_messageController.text.trim().isNotEmpty){
      _messages.value=[..._messages.value, _messageController.text.trim()];
      _messageController.clear();
    }
  }
  List<StaticChatMessage> messages = [
    StaticChatMessage(messageContent: 'Lorem Ipsum Dolor', messageType: 'receiver'),
    StaticChatMessage(messageContent: 'Lorem Ipsum Dolor Sit Amet Consectetur', messageType: 'sender'),
    StaticChatMessage(messageContent: 'Lorem Ipsum Dolor Sit Amet Consectetur', messageType: 'receiver'),
    StaticChatMessage(messageContent: 'Lorem Ipsum Dolor Sit Amet Consectetur', messageType: 'sender'),
    StaticChatMessage(messageContent: 'Lorem Ipsum Dolor', messageType: 'receiver'),
    StaticChatMessage(messageContent: 'Lorem Ipsum Dolor Sit Amet Consectetur', messageType: 'sender'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(139.h),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
          child: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.blue,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  right: 70.w,
                  top: 100.h,
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: AppColors.darkBlue,
                    child: SvgPicture.asset(AppImages.voiceCall),
                  ),
                ),
                Positioned(
                  right: 20.w,
                  top: 100.h,
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: AppColors.darkBlue,
                    child: SvgPicture.asset(AppImages.videoCall),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 70.h, left: 16.w, right: 16.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: AppColors.white.withOpacity(0.2),
                          child: const Icon(Icons.arrow_back, color: AppColors.white),
                        ),
                      ),
                      horizontalSpacer(10),
                      ClipOval(
                        child: Image.asset(
                          AppImages.doctorJohn,
                          width: 50.w,
                          height: 50.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      horizontalSpacer(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customText(
                            text: 'Dr. John Doe',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final message = messages[index];
                Color containerColor =
                message.messageType == 'sender' ? AppColors.ashBlue : AppColors.peach;

                return chatCard(
                  msg: message.messageContent,
                  bg: containerColor,
                  messageType: message.messageType,
                );
              },
            ),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          width: 393.w,
          height: 99.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SvgPicture.asset(
                  AppImages.plusIcon,
                  width: 40.w,
                  height: 40.h,
                ),
              ),
              chatTextFormField(
                bg: AppColors.blueLavender,
                imagePath: AppImages.emoji,
                focus: _focusNode,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SvgPicture.asset(
                  AppImages.voiceRecorder,
                  width: 40.w,
                  height: 40.h,
                ),
              ),
              // const Spacer(),

            ],
          ),
        ),
      ),
    );
  }

  Widget chatTextFormField({
    required Color bg,
    required String imagePath,
    required FocusNode focus,
  }) {
    return Container(
      width: 240.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Emoji Icon
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 30.h, bottom: 30.h),

          ),
          // TextFormField
          Expanded(
            child: TextFormField(
              controller: _messageController,
              focusNode: _focusNode,

              style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 14,
                color: AppColors.black,
              ),
              decoration: const InputDecoration(
                hintText: "Type a message...",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: AppColors.white,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              onFieldSubmitted: (value) {
                _focusNode.unfocus();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget chatCard({
    required String msg,
    required String messageType,
    required Color bg,
  }) {
    bool isSender = messageType == 'sender';
    return Padding(

      padding: EdgeInsets.symmetric(vertical: messageType == 'sender' ? 2.h : 8.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [

          Container(
            width: 215.w,
            height:61.h ,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                topLeft: Radius.circular(10.r),
                bottomRight: isSender ? Radius.circular(0.r) : Radius.circular(10.r),
                bottomLeft: isSender ? Radius.circular(10.r) : Radius.circular(0.r),
              ),
            ),
            child: customText(
              text: msg,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.black,


            ),
          ),
          verticalSpacer(5),

          Padding(
            padding: isSender
                ? EdgeInsets.only(right: 5.w)
                : EdgeInsets.only(left: 5.w),
            child: customText(
              text: '7:12 Min',
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }

}

class StaticChatMessage {
  final String messageContent;
  final String messageType;

  StaticChatMessage({
    required this.messageContent,
    required this.messageType,
  });
}









