import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/Di/dependency_injection.dart';
import 'package:egy_travel/model/login_request_body.dart';
import 'package:egy_travel/view/Screens/forgot_password.dart';
// import 'package:egy_travel/view/Screens/home_screen.dart';
import 'package:egy_travel/view/Screens/sign_up_screen.dart';
import 'package:egy_travel/view/Widgets/login_bloc_listener.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view/Widgets/shared_button.dart';
import 'package:egy_travel/view/Widgets/shared_text_field.dart';
import 'package:egy_travel/res/app_assets.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view_model/LoginCubit/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorsManager.primary.withOpacity(1),
          appBar: CustomAppBar(
            title: "Login".tr(),
            enableBack: false,
          ),
          body: Builder(builder: (context) {
            return Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: MediaQuery.of(context).size.height * 0.02,
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(Assets.images4),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 16, 32),
                              child: Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text(
                                    "StartYourJourney".tr(),
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: ColorsManager.secondPrimary
                                            .withOpacity(1)),
                                  ))),
                          CustomTextField(
                            // validator: (value){
                            //   if (value == null || value.isEmpty) {
                            //     return "ValidEmail".tr();
                            //   }
                            // },
                            // borderColor: ColorsManager.secondPrimary,
                            // controller: context.read<LoginCubit>().emailController,
                            labelText: "Email".tr(),
                          ),
                          CustomPasswordField(
                            // validator: (value){
                            //   if (value == null || value.isEmpty) {
                            //     return "validPassword".tr();
                            //   }
                            // },
                            // controller: context.read<LoginCubit>().passwordController,
                            labelText: "Password".tr(),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      onPressed: () {
                        context.read<LoginCubit>().emitLoginState(
                            LoginRequestBody(
                                email: context
                                    .read<LoginCubit>()
                                    .emailController
                                    .text,
                                password: context
                                    .read<LoginCubit>()
                                    .passwordController
                                    .text));
                      },
                      padding: EdgeInsetsDirectional.symmetric(
                          vertical: 16,
                          horizontal:
                              (MediaQuery.of(context).size.width * 0.35)),
                      backgroundColor:
                          ColorsManager.secondPrimary.withOpacity(1),
                      text: "Login".tr(),
                    ),
                    Center(
                      child: TextButton(
                          child: Text(
                            "ForgotPassword".tr(),
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: ColorsManager.secondPrimary,
                                fontWeight: FontWeight.w500),
                          ),
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()),
                              )),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: MediaQuery.of(context).size.width * 0.07),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.check_box_rounded)),
                          Text(
                            "RememberMe".tr(),
                            style: TextStyle(
                                color: ColorsManager.secondPrimary,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        "DontHaveAccount".tr(),
                      ),
                      TextButton(
                        child: Text(
                          "SignUp".tr(),
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: ColorsManager.secondPrimary,
                              fontWeight: FontWeight.w500),
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUPScreen()),
                        ),
                      ),
                    ]),
                    const LoginBlocListener()
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
