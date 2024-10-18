import 'package:e_tourism/Config/navigation/app_route.dart';
import 'package:e_tourism/core/constant/colors.dart';
import 'package:e_tourism/core/constant/values_manager.dart';
import 'package:e_tourism/core/util/snackbar_message.dart';
import 'package:e_tourism/core/util/valid_input.dart';
import 'package:e_tourism/core/widgets/loading_widget.dart';
import 'package:e_tourism/features/auth/signup/domain/entities/signup.dart';
import 'package:e_tourism/features/auth/signup/presentation/bloc/signUp_bloc.dart';
import 'package:e_tourism/features/auth/signup/presentation/widgets/button-auth-widget.dart';
import 'package:e_tourism/features/auth/signup/presentation/widgets/text_body_auth_widget.dart';
import 'package:e_tourism/features/auth/signup/presentation/widgets/text_form_auth_widget.dart';
import 'package:e_tourism/features/auth/signup/presentation/widgets/text_link_widget.dart';
import 'package:e_tourism/features/auth/signup/presentation/widgets/text_title_auth_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password_confirmation = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mobile = TextEditingController();
  SignUp signUp = SignUp(
      fName: '',
      lName: '',
      email: '',
      password: '',
      password_confirmation: '',
      address: '',
      mobile: '');

  @override
  void dispose() {
    super.dispose();
    fName.dispose();
    lName.dispose();
    email.dispose();
    password.dispose();
    password_confirmation.dispose();
    address.dispose();
    mobile.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() => AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          '65'.tr(),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColor.black,
              ),
        ),
      );

  Widget _buildBody() {
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: AppSizeH.s5, horizontal: AppSizeW.s10),
      child: SingleChildScrollView(
        child: Form(
          key: _formState,
          child: BlocConsumer<SignUpBloc, SignUpState>(
            listener: (context, state) async {
              if (state is LoadingSignUpState) {
                return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const LoadingWidget();
                    });
              } else if (state is ErrorSignUpState) {
                context.pop();
                return SnackBarMessage().showErrorSnackBar(
                    message: state.message, context: context);
              }
              if (state is SuccessSignUpState) {
                context.pop();
                context.goNamed(
                  RoutesNames.MainView,
                );
                return SnackBarMessage()
                    .showSuccessSnackBar(message: "66".tr(), context: context);
              }
            },
            builder: (context, state) {
              return Column(children: [
                TextTitleAuthWidget(text: "2".tr()),
                SizedBox(height: AppSizeH.s20),
                TextBodyAuthWidget(text: "67".tr()),
                SizedBox(height: AppSizeH.s40),
                TextFormAuthWidget(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 3, 20, "", context);
                  },
                  myController: fName,
                  hintText: "68".tr(),
                  iconData: Icons.person,
                  labelText: "68".tr(),
                ),
                TextFormAuthWidget(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 3, 20, "", context);
                  },
                  myController: lName,
                  hintText: "69".tr(),
                  iconData: Icons.person_2_outlined,
                  labelText: "69".tr(),
                ),
                TextFormAuthWidget(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 5, 100, "email", context);
                  },
                  myController: email,
                  hintText: "4".tr(),
                  iconData: Icons.alternate_email_outlined,
                  labelText: "8".tr(),
                ),
                TextFormAuthWidget(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 6, 40, "", context);
                  },
                  myController: password,
                  hintText: "9".tr(),
                  iconData: Icons.password,
                  labelText: "9".tr(),
                ),
                TextFormAuthWidget(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 5, 100, "", context);
                  },
                  myController: password_confirmation,
                  hintText: "70".tr(),
                  iconData: Icons.password_outlined,
                  labelText: "70".tr(),
                ),
                TextFormAuthWidget(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 5, 100, "", context);
                  },
                  myController: address,
                  hintText: "71".tr(),
                  iconData: Icons.account_box,
                  labelText: "71".tr(),
                ),
                TextFormAuthWidget(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 5, 11, "", context);
                  },
                  myController: mobile,
                  hintText: "72".tr(),
                  iconData: Icons.numbers,
                  labelText: "72".tr(),
                ),
                SizedBox(
                  height: AppSizeH.s40,
                  child: TextLinkWidget(
                    onTap: () {
                      context.goNamed(RoutesNames.loginScreen);
                    },
                    textOne: "73".tr(),
                    textTwo: "1".tr(),
                  ),
                ),
                SizedBox(height: AppSizeH.s40),
                ButtonAuthWidget(
                    text: "74".tr(),
                    onPressed: () {
                      signUp.fName = fName.text;
                      signUp.lName = lName.text;
                      signUp.email = email.text;
                      signUp.password = password.text;
                      signUp.password_confirmation = password_confirmation.text;
                      signUp.address = address.text;
                      signUp.mobile = mobile.text;
                      var formData = _formState.currentState;
                      if (formData!.validate()) {
                        BlocProvider.of<SignUpBloc>(context)
                            .add(ClickButtonSignUpEvent(signUp: signUp));
                      }
                    }),
                SizedBox(height: AppSizeH.s10),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
