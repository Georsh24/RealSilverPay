import 'package:phone_number/phone_number.dart';
import 'package:six_cash/controller/auth_controller.dart';
import 'package:six_cash/controller/create_account_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/styles.dart';
import 'package:six_cash/view/base/custom_app_bar.dart';
import 'package:six_cash/view/base/custom_country_code_picker.dart';
import 'package:six_cash/view/base/custom_logo.dart';
import 'package:six_cash/view/base/custom_large_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/view/base/custom_snackbar.dart';
import 'package:six_cash/view/screens/auth/other_info/other_info_screen.dart';
import 'package:six_cash/view/screens/auth/selfie_capture/camera_screen.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url =
    Uri.parse('https://www.youtube.com/channel/UCTMyFzMEhirw8ViHzmNNU4A');

class CreateAccountScreen extends StatefulWidget {
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController numberFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Get.find<CreateAccountController>()
        .setInitCountryCode(Get.find<SplashController>().getCountryCode());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getWhiteAndBlack(),
      appBar: CustomAppbar(title: 'login_registration'.tr),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                      height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE),
                  CustomLogo(
                      height: Dimensions.BIG_LOGO, width: Dimensions.BIG_LOGO),
                  const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                    child: Text(
                      'create_account_description'.tr,
                      style: rubikRegular.copyWith(
                        color: ColorResources.getBlackColor(),
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                  ),
                  GetBuilder<CreateAccountController>(
                    builder: (controller) => Container(
                      height: 52,
                      margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                      child: Center(
                        child: TextField(
                          controller: numberFieldController,
                          keyboardType: TextInputType.phone,
                          cursorColor: ColorResources.getPrimaryTextColor(),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(bottom: 5),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.RADIUS_SIZE_SMALL),
                              borderSide: BorderSide(
                                color: ColorResources.getPrimaryTextColor(),
                                width: 2,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.RADIUS_SIZE_SMALL),
                              borderSide: BorderSide(
                                color: ColorResources.textFieldBorderColor,
                                width: 1,
                              ),
                            ),
                            prefixIcon: CustomCountryCodePiker(
                              initSelect: controller.countryCode,
                              onChanged: (code) =>
                                  controller.setCountryCode(code),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GetBuilder<AuthController>(
            
            builder: ((controller) => Container(

   padding: const EdgeInsets.only(
                left: Dimensions.PADDING_SIZE_DEFAULT,
                right: Dimensions.PADDING_SIZE_DEFAULT,
                bottom: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE),


              child:             Column(
              //punto
                  children: [
                    Container(
                      //color: Color.fromRGBO(244, 67, 54, 1),
                      height: 60,
                      child: 
                           CustomLargeButton(
                            bottomPadding: 1,
                              backgroundColor:
                                  Theme.of(context).secondaryHeaderColor,
                              text: 'verify_umber'.tr,
                              onTap: () async {
                                _showMyDialog();
                                // String _phoneNumber = '${Get.find<CreateAccountController>().countryCode}${numberFieldController.text}';
                                // try{

                                // await PhoneNumberUtil().parse(_phoneNumber).then((value) => Get.find<CreateAccountController>().sendOtpResponse(number: _phoneNumber));

                                // }catch(e){
                                //   showCustomSnackBar('please_input_your_valid_number'.tr, isError: true);
                                //   numberFieldController.clear();
                                // }
                              },
                            )
                      
                    ),
                    
                      InkWell(
                      onTap: () => launchUrl(Uri.parse(
                          'https://realsilvercoin.io/politicadeprivacidad.html')),
                      child: Text(
                        'Políticas de Privacidad >',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      ),
                    )
                    
                  ],
                ),
            ) 

                
                ),
            // builder: (controller) => Container(
            //   height: 110,
            //   child: !controller.isLoading
            //       ? CustomLargeButton(
            //           backgroundColor: Theme.of(context).secondaryHeaderColor,
            //           text: 'verify_umber'.tr,
            //           onTap: () async {
            //             _showMyDialog();
            //             // String _phoneNumber = '${Get.find<CreateAccountController>().countryCode}${numberFieldController.text}';
            //             // try{

            //             // await PhoneNumberUtil().parse(_phoneNumber).then((value) => Get.find<CreateAccountController>().sendOtpResponse(number: _phoneNumber));

            //             // }catch(e){
            //             //   showCustomSnackBar('please_input_your_valid_number'.tr, isError: true);
            //             //   numberFieldController.clear();
            //             // }
            //           },
            //         )
            //       : Center(
            //           child: CircularProgressIndicator(
            //               color: Theme.of(context).primaryColor)),
            // ),
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Aviso de Privacidad'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Real silver accede a tu lista de contactos y galería de imágenes para poder permitir seleccionar a quién enviarle CDGs Real Silver. El uso de imágenes es solo es para generar códigos QR y acceder a la cámara para generarlos. Real Silver no comunica, transmite, ni cede a terceros ajenos, en ninguna circunstancia estos datos.¿Aceptas el uso de tu lista de contactos y galería para este fin?'),
                Column(
                  children: [
                    Text('Le nuestra'),
                    InkWell(
                      onTap: () => launchUrl(Uri.parse(
                          'https://realsilvercoin.io/politicadeprivacidad.html')),
                      child: Text(
                        'Políticas de Privacidad >',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Rechazar')),
            TextButton(
              child: const Text('Acepto'),
              onPressed: () async {
                String _phoneNumber =
                    '${Get.find<CreateAccountController>().countryCode}${numberFieldController.text}';
                try {
                  await PhoneNumberUtil().parse(_phoneNumber).then((value) =>
                      Get.find<CreateAccountController>()
                          .sendOtpResponse(number: _phoneNumber));
                } catch (e) {
                  showCustomSnackBar('please_input_your_valid_number'.tr,
                      isError: true);
                  numberFieldController.clear();
                }
              },
            ),
          ],
        );
      },
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
