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
      body: Column(
        children: [
          Expanded(child: Consumer<ChatProvider>(
            builder: (context,provider, child){
              return ListView.builder(
                  itemCount: provider.messages.length,
                  itemBuilder:(context,index){
                    final message=provider.messages[index];
                    return Column();
                  }
                  );
            },
          ),),
          const Padding(padding: EdgeInsets.all(8),
          child: Row(children: [
            Expanded(child:TextField())
          ],),
          )
        ],
      ),
    );
  }
}




