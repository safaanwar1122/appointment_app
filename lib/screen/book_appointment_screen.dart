
import 'package:appointment_app/export.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:table_calendar/table_calendar.dart';
class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});
  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final TextEditingController controller=TextEditingController();
  var containerColorProvider;
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    void iniState() {
      containerColorProvider = Provider.of<ContainerStateProvider>(context);
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: null,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 23.h, bottom: 10.h),
                  child: Column(
                    children: [
                      verticalSpacer(10),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: AppColors.blue.withOpacity(.1),
                              child: Container(
                                width: 40.w,
                                height: 40.h,
                                child:
                                const Icon(Icons.arrow_back, color: AppColors.blue),
                              ),
                            ),
                          ),
                          horizontalSpacer(50),
                          Center(
                            child: customText(
                              text: AppConstants.bookAppointments,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.black,
                              lineHeight: null,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  AppImages.image,
                  fit: BoxFit.cover,
                ),
                doctorOverviewCard(
                  doctorName: 'Dr. Ryan Joe',
                  specialization: 'Neurologist',
                ),
                verticalSpacer(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    doctorProfileCard(
                      avatarRadius: 20.r,
                      imagePath: AppImages.patientsIcon,
                      title: 'Patients',
                      record: '120+',
                      bg: AppColors.lightGrey.withOpacity(0.2),
                    ),
                    doctorProfileCard(
                      avatarRadius: 20.r,
                      imagePath: AppImages.yearsExpIcon,
                      title: 'Years Exp',
                      record: '7+',
                      bg: AppColors.lightGrey.withOpacity(0.2),
                    ),
                    doctorProfileCard(
                      avatarRadius: 20.r,
                      imagePath: AppImages.ratingIcon,
                      title: 'Rating',
                      record: '4.9',
                      bg: AppColors.lightGrey.withOpacity(0.2),
                    ),
                    doctorProfileCard(
                      avatarRadius: 20.r,
                      imagePath: AppImages.reviewsIcon,
                      title: 'Reviews',
                      record: '100+',
                      bg: AppColors.lightGrey.withOpacity(0.2),
                    ),
                  ],
                ),
                verticalSpacer(30),
                customText(
                    text: 'About Me',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.black),
                RichReadMoreText.fromString(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    textStyle: TextStyle(color: AppColors.grey),
                    settings: LengthModeSettings(
                        trimLength: 90,
                        trimCollapsedText: 'Read More',
                        trimExpandedText: 'Read Less',
                        onPressReadMore: () {},
                        onPressReadLess: () {},
                        lessStyle: TextStyle(
                          color: Colors.red,
                        ),
                        moreStyle: TextStyle(color: AppColors.blue),),),
                verticalSpacer(30),
                customText(
                    text: 'Patient Details',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.blue),
                verticalSpacer(10),
                ChangeNotifierProvider(
                  create: (_) => ContainerStateProvider(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      containerColorState(
                        containerId: "yourself", // Unique identifier
                        text: "Yourself",
                      ),
                      SizedBox(width: 10), // Spacing between containers
                      containerColorState(
                        containerId: "anotherPerson", // Unique identifier
                        text: "Another Person",
                      ),
                    ],
                  ),
                ),
                verticalSpacer(10),
                customText(
                    text: 'Full Name',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.black),
                verticalSpacer(2),
                Container(
                  width: 327.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    color: AppColors.lightLavender,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 10.h,
                    ),
                    child: customText(
                        text: 'Safa Anwar',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: AppColors.textColor),
                  ),
                ),
                verticalSpacer(10),
                customText(
                    text: 'Age',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.black),
                verticalSpacer(2),
                Container(
                  width: 327.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    color: AppColors.lightLavender,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 10.h,
                    ),
                    child: customText(
                        text: '40',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: AppColors.textColor),
                  ),
                ),
                verticalSpacer(20),
                verticalSpacer(10),
                customText(
                    text: 'Gender',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.black),
                verticalSpacer(4),
                ChangeNotifierProvider(
                  create: (_) => ContainerStateProvider(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      containerColorState(
                        containerId: "male", // Unique identifier
                        text: "Male",
                      ),
                      horizontalSpacer(10), // Spacing between containers
                      containerColorState(
                        containerId: "female", // Unique identifier
                        text: "Female",
                      ),
                      horizontalSpacer(10), // Spacing between containers
                      containerColorState(
                        containerId: "other", // Unique identifier
                        text: "Other",
                      ),
                    ],
                  ),
                ),
                verticalSpacer(10),
                Container(
                  width: double.infinity,
                  height: 1.h,
                  color: AppColors.blue,
                ),
                verticalSpacer(10),
                customText(
                    text: 'Describe your problem',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.black),
                verticalSpacer(10),
                ChangeNotifierProvider(create: (_)=>TextFieldProvider(),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 20.h),
                  child: Container(
                    width: 315.w,
                    height: 107.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.blue.withOpacity(0.2),
                        width: 1.w,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 10.h,
                      ),
                      child: Consumer<TextFieldProvider>(

                          builder: (context,textFieldProvider,child){
                            return TextFormField(
                                controller: controller,


                                style: const TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                color: AppColors.black,
                            ),
                            decoration: const InputDecoration(
                            hintText: "Enter Your Problem Here...",
                            hintStyle: TextStyle(
                            fontSize: 14,
                            color: AppColors.black,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            ));

                          })
                    ),
                  ),
                ),
                ),
                
                verticalSpacer(10),
                Container(
                  width: double.infinity,
                  height: 1.h,
                  color: AppColors.blue,
                ),
                verticalSpacer(10),
                customText(
                    text: 'Select Day',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.blue),
                verticalSpacer(10),
                TableCalendar(
                  firstDay: DateTime(2020),
                  lastDay: DateTime(2025),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.orange, // Default selected color
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(color: Colors.white),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    headerMargin: EdgeInsets.zero, // Remove margin above the header
                    titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    headerPadding: EdgeInsets.symmetric(vertical: 4), // Reduce vertical padding
                  ),
                  // Set the start of the week to Monday
                  startingDayOfWeek: StartingDayOfWeek.monday, // Start from Monday
                ),
                verticalSpacer(40),
                customText(
                    text: 'Available Time',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.blue),
                verticalSpacer(10),
              availableTime(time: '', ),

                verticalSpacer(80),
                customButton(
                    label: 'Make Appointment',
                    onPressed: () {
                      Get.to(() => const AppointmentDetailsScreen());
                    },
                    buttonColor: AppColors.blue,
                    textColor: AppColors.white),
                verticalSpacer(50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget doctorProfileCard(
      {required double avatarRadius,
      required String imagePath,
      required String title,
      required String record,
      required Color bg}) {
    return Column(
      children: [
        CircleAvatar(
          radius: avatarRadius,
          backgroundColor: bg,
          child: SvgPicture.asset(
            imagePath,
            fit: BoxFit.scaleDown,
            height: avatarRadius,
            width: avatarRadius,
          ),
        ),
        verticalSpacer(6),
        customText(
            text: record,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppColors.black),
        verticalSpacer(2),
        customText(
            text: title,
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: AppColors.grey)
      ],
    );
  }

  Widget doctorOverviewCard({
    required String doctorName,
    required String specialization,
  }) {
    return Container(
      width: 318.w,
      height: 82.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.1),
              //spreadRadius: 1.r,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(
                text: doctorName,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.black),
            customText(
                text: specialization,
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: AppColors.grey),
          ],
        ),
      ),
    );
  }

  Widget containerColorState({
    required String containerId, // Unique identifier for this container
    required String text,
  }) {
    return Consumer<ContainerStateProvider>(
      builder: (context, containerColorProvider, child) {
        bool isSelected =
            containerColorProvider.selectedContainer == containerId;
        return GestureDetector(
          onTap: () => containerColorProvider.toggleSelection(containerId),
          child: Container(
            width: 97.w,
            height: 40.h,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.blue : AppColors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.blue),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: isSelected ? AppColors.white : AppColors.blue,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget availableTime({
    required String time,
     Color? bg,
  }) {
    return  Column(
      children: [
        Row(
          children: [
            Container(
              width: 55.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: customText(
                    text: '9:00 AM ',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.blue),
              ),
            ),
            horizontalSpacer(2),
            Container(
              width: 55.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: customText(
                    text:  '9:30 AM ',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.blue),
              ),
            ),
            horizontalSpacer(2),
            Container(
              width: 55.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: customText(
                    text:  '10:00 AM ',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.white),
              ),
            ),
            horizontalSpacer(2),
            Container(
              width: 55.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: customText(
                    text: '19:30 AM ',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.blue),
              ),
            ),
            horizontalSpacer(2),
            Container(
              width: 55.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: customText(
                    text:  '11:00 AM ',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.blue),
              ),
            ),
          ],
        ),
        verticalSpacer(6),
        Row(
          children: [
            Container(
              width: 55.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: customText(
                    text:  '11:30 AM ',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.black),
              ),
            ),
            horizontalSpacer(2),
            Container(
              width: 55.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: customText(
                    text:  '12:00 AM ',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.blue),
              ),
            ),
            horizontalSpacer(2),
            Container(
              width: 55.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: customText(
                    text: '12:30 AM ',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.blue),
              ),
            ),
            horizontalSpacer(2),
            Container(
              width: 55.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: customText(
                    text:  '1:00 PM ',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.black),
              ),
            ),
            horizontalSpacer(2),
            Container(
              width: 55.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: customText(
                    text:  '1:30 PM ',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.black),
              ),
            ),
          ],
        ),
        verticalSpacer(6),
        Row(
          children: [
            Container(
              width: 55.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: customText(
                    text:  '2:00 PM ',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.blue),
              ),
            ),
            horizontalSpacer(2),
            Container(
              width: 55.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: customText(
                    text:  '2:30 PM ',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.black),
              ),
            ),
            horizontalSpacer(2),
            Container(
              width: 55.w,
              height: 24.h,
              decoration: BoxDecoration(
                color:AppColors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: customText(
                    text:  '3:00 PM ',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.black),
              ),
            ),
            horizontalSpacer(2),
            Container(
              width: 55.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: customText(
                    text:  '3:30 PM ',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.blue),
              ),
            ),
            horizontalSpacer(2),
            Container(
              width: 55.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: customText(
                    text: '4:00 PM ',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.blue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
