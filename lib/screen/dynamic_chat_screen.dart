import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../controllers/auth_provider.dart';
import '../models/chat_message_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../widgets/custome_text.dart';
import '../widgets/spacer.dart';

class DynamicChatScreen extends StatefulWidget {
  const DynamicChatScreen({super.key});

  @override
  State<DynamicChatScreen> createState() => _DynamicChatScreenState();
}

class _DynamicChatScreenState extends State<DynamicChatScreen> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);

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
                          child: const Icon(Icons.arrow_back,
                              color: AppColors.white),
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
      body: Column(
        children: [
          Expanded(
            child: Consumer<ChatProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                    itemCount: provider.messages.length,
                    itemBuilder: (context, index) {
                      final message = provider.messages[index];
                      return ChatMessageCard(message: message);
                    });
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.blue,
                child: IconButton(
                    onPressed: () {
                      if (messageController.text.isNotEmpty) {
                        chatProvider.addMessage(messageController.text);
                        messageController.clear();
                      }
                    },
                    icon: Icon(
                      Icons.send,
                      color: AppColors.white,
                    )),
              ),
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
            padding: EdgeInsets.only(
                left: 10.w, right: 10.w, top: 30.h, bottom: 30.h),
          ),
          // TextFormField
          Expanded(
            child: TextFormField(
              controller: messageController,
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
}

class ChatMessageCard extends StatelessWidget {
  final ChatMessage message;
  const ChatMessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
      alignment:
          message.isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: message.isSentByUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 0.55.sw),
            child: Container(

              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: message.isSentByUser ? AppColors.ashBlue : AppColors.peach,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.r),
                  topLeft: Radius.circular(10.r),
                  bottomRight: message.isSentByUser
                      ? Radius.circular(0.r)
                      : Radius.circular(10.r),
                  bottomLeft: message.isSentByUser
                      ? Radius.circular(10.r)
                      : Radius.circular(0.r),
                ),
              ),
              child: customText(
                  text: message.message,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color:
                  message.isSentByUser ? AppColors.black : AppColors.black),
            ),
          ),
          verticalSpacer(5),
          customText(
              text: '${message.timestamp.hour}:${message.timestamp.minute} Min',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: AppColors.grey),
        ],
      ),
    );
  }
}
