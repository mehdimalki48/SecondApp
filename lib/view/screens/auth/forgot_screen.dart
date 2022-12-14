import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fmtmimi/constants/images.dart';
import 'package:fmtmimi/constants/size_config.dart';
import 'package:fmtmimi/constants/style_data.dart';
import 'package:fmtmimi/controllers/auth_controller.dart';
import 'package:fmtmimi/view/widgets/custom_loader.dart';
import 'package:fmtmimi/view/widgets/custom_text_field.dart';
import 'package:fmtmimi/view/widgets/default_btn.dart';
import 'package:fmtmimi/view/widgets/pin_filed_widget.dart';

import 'forgot_set_password_screen.dart';

class ForgotScreen extends StatefulWidget {
  static const routeName = 'signup_screen';

  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<ForgotScreen> {
  final _formKey = GlobalKey<FormState>();
  //Text controller
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passController = TextEditingController();
  final pinController = TextEditingController();
  final phoneController = TextEditingController();
  final countryCodeController = TextEditingController();

  bool selectedPhone = true, selectedEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Get.isDarkMode ? const Color(0xFF232323) : const Color(0xFFFFFFFF),
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    kHeightBox40,
                    Center(
                      child: Image.asset(
                        Get.isDarkMode
                            ? Images.largeLogoDark
                            : Images.largeLogo,
                        width: SizeConfig.screenWidth! / 2,
                      ),
                    ),
                    kHeightBox20,
                    Text(
                      authController.forgotCode
                          ? 'Confirm Code'
                          : 'Forgot your Password'.tr,
                      style: kRegularText2.copyWith(
                        fontWeight: FontWeight.w300,
                        color: Get.isDarkMode
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF303030),
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    /*Container(
                      child: code
                          ? selectedPhone
                              ? IconTextWidget(
                                  icon: Images.phone,
                                  title: 'Phone No.'.tr,
                                  selected: selectedPhone,
                                  onTap: () {})
                              : IconTextWidget(
                                  icon: Images.email,
                                  title: 'Email'.tr,
                                  selected: true,
                                  onTap: () {})
                          : const SizedBox(),
                    ),
                    Visibility(
                      visible: code ? false : true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconTextWidget(
                              icon: Images.phone,
                              title: 'Phone No.'.tr,
                              selected: selectedPhone,
                              onTap: () {
                                setState(() {
                                  email = false;
                                  selectedPhone = true;
                                  selectedEmail = false;
                                });
                              }),
                          IconTextWidget(
                              icon: Images.email,
                              title: 'Email'.tr,
                              selected: selectedEmail,
                              onTap: () {
                                setState(() {
                                  email = true;
                                  selectedPhone = false;
                                  selectedEmail = true;
                                });
                              }),
                        ],
                      ),
                    ),*/
                    const SizedBox(
                      height: 47,
                    ),
                    /* Visibility(
                      visible: code ? false : true,
                      child: Container(
                        child: email
                            ? CustomTextField(
                                labelText: 'Email Address'.tr,
                                controller: emailController,
                                // focusNode: phoneController,
                                // nextFocus: _passwordFocus,
                                inputType: TextInputType.emailAddress,
                                divider: true,
                              )
                            : Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CountryCodePicker(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        onChanged: print,
                                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                        initialSelection: 'IT',
                                        showFlagDialog: true,
                                        dialogBackgroundColor: Get.isDarkMode
                                            ? kBlackColor2
                                            : kWhiteColor,
                                        comparator: (a, b) =>
                                            b.name!.compareTo(a.name ?? ""),
                                        //Get the country information relevant to the initial selection
                                        onInit: (code) => log(
                                            "on init ${code!.name} ${code.dialCode} ${code.name}"),
                                      ),
                                      Expanded(
                                          child: CustomTextField(
                                        labelText: 'Phone No.'.tr,
                                        controller: phoneController,
                                        // focusNode: phoneController,
                                        // nextFocus: _passwordFocus,
                                        inputType: TextInputType.phone,
                                        divider: false,
                                      )),
                                    ],
                                  ),
                                  kHeightBox5,
                                  Container(
                                    margin: const EdgeInsets.only(left: 0.0),
                                    height: .3,
                                    color: kStUnderLineColor,
                                  ),
                                ],
                              ),
                      ),
                    ),*/
                    CustomTextField(
                      labelText: 'Email Address'.tr,
                      controller: emailController,
                      // focusNode: phoneController,
                      // nextFocus: _passwordFocus,
                      inputType: TextInputType.emailAddress,
                      divider: true,
                    ),
                    Container(
                        child: authController.forgotCode
                            ? CustomTextField(
                                absorbing: true,
                                labelText: 'Email Address'.tr,
                                controller: userNameController,
                                // focusNode: phoneController,
                                // nextFocus: _passwordFocus,
                                inputType: TextInputType.text,
                                divider: false,
                              )
                            : const SizedBox()),
                    Container(
                      child: authController.forgotCode
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  kHeightBox30,
                                  PintFiledWidget(
                                    labelText: 'Pin'.tr,
                                    fieldController: pinController,
                                    icon: Icons.visibility,
                                    validation: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter password'.tr;
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                    ),
                    kHeightBox40,
                    DefaultBtn(
                      width: SizeConfig.screenWidth,
                      radius: 10.0,
                      title:
                          authController.forgotCode ? 'Submit'.tr : 'Send'.tr,
                      onPress: () {
                        if (authController.forgotIsEmail) {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => const CustomLoader());

                            authController.resetPassword(
                                emailController.text, context);
                          }
                        }

                        if (authController.forgotCode) {
                          if (_formKey.currentState!.validate()) {
                            Get.to(() => ForgotSetPassScreen(
                                  email: emailController.text,
                                  code: pinController.text,
                                ));
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
