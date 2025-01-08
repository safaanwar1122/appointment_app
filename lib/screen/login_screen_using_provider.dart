import 'package:appointment_app/export.dart';

class LoginScreenUsingProvider extends StatefulWidget {
  const LoginScreenUsingProvider({super.key});

  @override
  State<LoginScreenUsingProvider> createState() => _LoginScreenUsingProviderState();
}

class _LoginScreenUsingProviderState extends State<LoginScreenUsingProvider> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(139),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            width: double.infinity,
            height: 139.h,
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 296,
                  top: 0,
                  child: SvgPicture.asset(
                    AppImages.whiteShade,
                  ),
                ),
                Column(
                  children: [
                    verticalSpacer(80),
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
                              radius: 15,
                              backgroundColor: AppColors.white.withOpacity(0.2),
                              child: const Icon(Icons.arrow_back, color: AppColors.white),
                            ),
                          ),
                          const Spacer(),
                          customText(
                            text: AppConstants.login,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                            lineHeight: null,
                          ),
                          horizontalSpacer(160)
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  return customTextFieldUsingProvider(
                    controller: usernameController,
                    hintText: "Enter email..",
                    hintStyle: TextStyle(
                      color: AppColors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      height: 2.2.h,
                    ),
                    contentPadding: EdgeInsets.only(left: 5.w),
                    prefixIcon: SvgPicture.asset(
                      AppImages.emailSvg,
                      width: 18.w,
                      height: 14.h,
                      fit: BoxFit.scaleDown,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 0.5.w, vertical: 7.h),
                    errorText: authProvider.emailError,
                    textStyle: const TextStyle(
                      color: AppColors.iconColor,
                    ),
                    onChanged: (value) {
                      authProvider.validateEmail(value);
                    },
                  );
                },
              ),

              Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  return customTextFieldUsingProvider(
                    controller: passwordController,
                    isPasswordField: true,
                    hintText: "Enter password..",
                    hintStyle: const TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      height: 2.2,
                    ),
                    contentPadding: const EdgeInsets.only(left: -1.0),
                    prefixIcon: SvgPicture.asset(
                      AppImages.lockSvg,
                      width: 16.w,
                      height: 19.h,
                      fit: BoxFit.scaleDown,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 0.h),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        authProvider.togglePasswordVisibility();
                      },
                      child: SvgPicture.asset(
                        AppImages.eyeSvg,
                        width: 20.w,
                        height: 20.h,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    errorText: authProvider.passwordError,
                    textStyle: const TextStyle(
                      color: AppColors.iconColor,
                    ),
                    onChanged: (value) {
                      authProvider.validatePassword(value);
                    },
                  );
                },
              ),

              verticalSpacer(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: customText(
                      text: 'Forgot Password?',
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: AppColors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.blue,
                    ),
                  ),
                ],
              ),
              verticalSpacer(60),
             //without Snackbar
             /* customButton(
                label: 'Login',
                onPressed: () {
                  authProvider.validateEmail(usernameController.text);
                  authProvider.validatePassword(passwordController.text);

                  if (authProvider.emailError == null && authProvider.passwordError == null) {
                  }
                },
                buttonColor: AppColors.blue,
                textColor: AppColors.white,
                width: 300.w,
                height: 48.h,
              ),*/
             // with Snackbar
              customButton(
                label: 'LOGIN',
                onPressed: () {
                  authProvider.validateEmail(usernameController.text);
                  authProvider.validatePassword(passwordController.text);

                   if (authProvider.emailError != null) {
                     ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text(authProvider.emailError!)),
                     );
                   }
                   else if(authProvider.passwordError!=null){
                     ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text(authProvider.passwordError!)),);
                   }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login Successful')),);
                   }
                },
                buttonColor: AppColors.blue,
                textColor: AppColors.white,
                width: 300.w,
                height: 48.h,
              ),

              verticalSpacer(50),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.lightGrey,
                      thickness: 1.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: customText(
                      text: "Or sign in with",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.iconColor,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.lightGrey,
                      thickness: 1.h,
                    ),
                  ),
                ],
              ),
              verticalSpacer(50),
              Container(
                width: 300.w,
                height: 57.h,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blue, width: 1.w),
                  borderRadius: BorderRadius.circular(35.r),
                  color: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppImages.google,
                      fit: BoxFit.scaleDown,
                      width: 24.w,
                      height: 24.h,
                    ),
                    horizontalSpacer(8),
                    customText(
                      text: 'Login with Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.blue,
                    ),
                  ],
                ),
              ),
              verticalSpacer(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                    text: "Don't Have An Account?",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.black,
                    lineHeight: 1.5,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const SignUpScreenUsingProvider());
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    child: customText(
                      text: 'SIGN UP',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      lineHeight: 1.5,
                      color: AppColors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.blue,
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


