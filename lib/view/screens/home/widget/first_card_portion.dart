import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/helper/price_converter.dart';
import 'package:six_cash/helper/route_helper.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/images.dart';
import 'package:six_cash/util/styles.dart';
import 'package:six_cash/view/base/custom_ink_well.dart';
import 'package:six_cash/view/screens/home/widget/banner_view.dart';
import 'package:six_cash/view/screens/home/widget/custom_card.dart';
import 'package:six_cash/view/screens/transaction_money/transaction_money_screen.dart';
import 'package:six_cash/view/screens/transaction_money/widget/transaction_money_balance_input.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://www.youtube.com/channel/UCTMyFzMEhirw8ViHzmNNU4A');

class FirstCardPortion extends StatelessWidget {
  final ProfileController profileController;
  const FirstCardPortion({Key key,@required this.profileController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    return SizedBox(
      child: Stack(
        children: [
          Container(height: Dimensions.MAIN_BACKGROUND_CARD_WEIGHT, color: ColorResources.getPrimaryColor(),),
          Positioned(
            child: Column(
              children: [
                Container(width: double.infinity, height: Dimensions.ADD_MONEY_CARD,
                  margin: const  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE, vertical: Dimensions.PADDING_SIZE_LARGE),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.RADIUS_SIZE_LARGE), color: Theme.of(context).cardColor,
                  ),


                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('your_balance'.tr, style: rubikLight.copyWith(color: ColorResources.getBalanceTextColor(), fontSize: Dimensions.FONT_SIZE_LARGE,),),

                            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL,),
                            profileController.userInfo != null?
                            Text(PriceConverter.balanceWithSymbol(balance: profileController.userInfo.balance.toString()),
                             style: rubikMedium.copyWith(color: ColorResources.getPrimaryTextColor(), fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                             ),
                               )
                                :Text(PriceConverter.convertPrice(context, 0.00),
                              style: rubikMedium.copyWith(color: ColorResources.getPrimaryTextColor(), fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                              ) ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(height: Dimensions.ADD_MONEY_CARD,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.RADIUS_SIZE_LARGE), color: Theme.of(context).secondaryHeaderColor,
                        ),


                        // child: CustomInkWell(
                        //   onTap: () => Get.to(TransactionMoneyBalanceInput(transactionType: 'add_money')),
                        //   radius: Dimensions.RADIUS_SIZE_LARGE,
                        //   child: Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                        //     child: Column(mainAxisAlignment: MainAxisAlignment.center,

                        //       children: [
                        //         SizedBox(height: 34, child: Image.asset(Images.wolet_logo)),
                        //         SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL,),
                        //         Text('add_money'.tr, style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: Theme.of(context).textTheme.bodyText1.color),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ),
                    ],
                  ),
                ),

                /// Cards...
                SizedBox(
                  height: Dimensions.TRANSACTION_TYPE_CARD_HEIGHT,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.FONT_SIZE_EXTRA_SMALL),
                    child: Row(
                      children: [
                        Expanded(child: CustomCard(image: Images.sendMoney_logo, text: 'send_money_'.tr, color: Theme.of(context).secondaryHeaderColor, onTap: ()=> Get.to(()=> TransactionMoneyScreen(fromEdit: false,transactionType: 'send_money')))),

                    
                        Expanded(child: CustomCard(image: Images.requestMoneyLogo, text: 'request_money'.tr, color: ColorResources.getRequestMoneyCardColor(), onTap: ()=> Get.to(()=> TransactionMoneyScreen(fromEdit: false,transactionType: 'request_money')))),

                        Expanded(child: CustomCard(image: Images.request_list_image2, text: 'requests'.tr, color: ColorResources.getReferFriendCardColor(), onTap: () => Get.toNamed(RouteHelper.getRequestedMoneyRoute(from: 'other'))),
                        ),

                        //     Expanded(child: CustomCard(image: Images.cashOut_logo, text: 'cash_out_'.tr, color: ColorResources.getCashOutCardColor(), onTap: (() {
                        //   _launchUrl();
                        // }))),
                            Expanded(child: CustomCard(image: Images.cashOut_logo, text: 'Como funciona?'.tr, color: ColorResources.getCashOutCardColor(), onTap: (() {
                          _launchUrl();
                        }))),


                      ],
                    ),
                  ),
                ),



                BannerView(),

              ],
            ),
          ),
        ],
      ),
    );
  }

  

}
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}