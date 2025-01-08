import 'package:appointment_app/export.dart';
class ChatScreenUsingProvider extends StatelessWidget {
  const ChatScreenUsingProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.h),
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
                  left: 296.w,
                  top: 0.h,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 50.w, right: 2.w, top: 62.h, bottom: 10.h),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: AppColors.white),
                    ),
                  ),
                ),
                Column(
                  children: [
                    verticalSpacer(70),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          horizontalSpacer(16),
                          Center(
                            child: customText(
                              text: AppConstants.chat,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white,
                              lineHeight: null,
                            ),
                          ),
                          horizontalSpacer(130),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 40.w, right: 40.w, bottom: 0.h, top: 5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<MessageCallProvider>().setSelectedScreen('Messages');
                            },
                            child: Column(
                              children: [
                                customText(
                                  text: 'Messages',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: context.watch<MessageCallProvider>().selectedScreen == 'Messages'
                                      ? AppColors.white
                                      : AppColors.white.withOpacity(0.5),
                                ),
                                verticalSpacer(6),
                                Container(
                                  margin: EdgeInsets.only(top: 2.h),
                                  height: 4.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                    color: context.watch<MessageCallProvider>().selectedScreen == 'Messages'
                                        ? AppColors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(2.r),
                                      topLeft: Radius.circular(2.r),
                                      bottomRight: Radius.circular(2.r),
                                      bottomLeft: Radius.circular(2.r),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<MessageCallProvider>().setSelectedScreen('Calls');
                            },
                            child: Column(
                              children: [
                                customText(
                                  text: 'Calls',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: context.watch<MessageCallProvider>().selectedScreen == 'Calls'
                                      ? AppColors.white
                                      : AppColors.white.withOpacity(0.5),
                                ),
                                verticalSpacer(6),
                                Container(
                                  margin: EdgeInsets.only(top: 2.h),
                                  height: 4.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                    color: context.watch<MessageCallProvider>().selectedScreen == 'Calls'
                                        ? AppColors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(2.r),
                                      topLeft: Radius.circular(2.r),
                                      bottomRight: Radius.circular(2.r),
                                      bottomLeft: Radius.circular(2.r),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Consumer<MessageCallProvider>(builder: (context, messageCallProvider, child){
        return ListView.builder(
          padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: messageCallProvider.selectedScreen=='Messages'
                ?messageCallProvider.messages.length:messageCallProvider.call.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index){
            return messageCallProvider.selectedScreen=='Messages'?messageCard(
                title:messageCallProvider.messages[index].title,
                chat:messageCallProvider.messages[index].chat,
                date: messageCallProvider.messages[index].date,
                imagePath: messageCallProvider.messages[index].image):
            callCard(
                title: messageCallProvider.call[index].title,
                doctorImagePath:messageCallProvider.call[index].doctorImagePath,
                audioCallPath:messageCallProvider.call[index].audioCallPath,
                videoCallPath: messageCallProvider.call[index].videoCallPath);
            });
      }),
    );

  }

  Widget messageCard({
    required String title,
    required String chat,
    required String date,
    required String imagePath,
  }) {
    return GestureDetector(
      onTap: (){
        Get.to(() =>  DynamicChatScreen(
doctorName: title,
        ));
      },
      child: Padding(

        padding: const EdgeInsets.all(6.0),
        child: Container(
         /* width: 344.w,
          height: 80.h,*/
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6.r),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1.r,
                blurRadius: 5,
                color: AppColors.grey.withOpacity(0.2),
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Row(
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10.w), // Spacing between the image and text
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                            text: title,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.black,
                          ),
                          customText(
                            text: date,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.grey,
                          ),
                        ],
                      ),

                      customText(
                        text: chat,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget callCard({
    required String title,
    required String doctorImagePath,
    required String audioCallPath,
    required String videoCallPath,
  }){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
       /* width: 344.w,
        height: 80.h,*/
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1.r,
              blurRadius: 5,
              color: AppColors.grey.withOpacity(0.2),
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Row(
            children: [
              // Doctor's Image
              ClipOval(
                child: Image.asset(
                  doctorImagePath,
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.cover,
                ),
              ),
              horizontalSpacer(10), // Spacing between image and title

              // Title
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    customText(
                      text: title,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                  ],
                ),
              ),

              // Call icons (on the right)
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Your voice call logic
                    },
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: AppColors.darkBlue,
                      child: SvgPicture.asset(audioCallPath,
                        fit: BoxFit.scaleDown,),
                    ),
                  ),
                  horizontalSpacer(10), // Spacing between icons
                  GestureDetector(
                    onTap: () {
                      // Your video call logic
                    },
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: AppColors.darkBlue,
                      child: SvgPicture.asset(videoCallPath,
                        fit: BoxFit.scaleDown,),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }

}
