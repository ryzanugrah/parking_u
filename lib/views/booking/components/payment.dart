import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:parking_u/models/parkir_model.dart';
import 'package:sizer/sizer.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';

class Payment extends StatefulWidget {
  final ParkirModel item;

  const Payment({Key key, this.item}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int _filterGroup = 1;

  final List<RadioGroup> _filterList = [
    RadioGroup(index: 1, text: "Cash"),
    RadioGroup(index: 2, text: "Dompet Digital"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(0),
      ),
      child: GestureDetector(
        onTap: () => displayBottomSheet(context),
        child: Container(
          height: getProportionateScreenHeight(50),
          decoration: BoxDecoration(
            color: primaryBackgroundColor,
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.1.w,
                blurRadius: 1.0.w,
                offset: Offset(0, 0.2.h),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(10),
                    right: getProportionateScreenWidth(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50.0.w,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Pilih Metode Pembayaran',
                                  style: TextStyle(
                                    fontSize: caption.sp - 2,
                                    color: secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.arrow_forward_ios_outlined,
                                    size: 5.0.w)
                              ],
                            ),
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
    );
  }

  void displayAwesomeDialogue() {
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.WARNING,
      headerAnimationLoop: false,
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      autoHide: Duration(seconds: 6),
      title: 'Dompet Digital Dalam Pengembangan',
      desc: 'Dompet Digital Dalam Pengembangan',
      btnOkText: 'Silahkan Pilih Cash',
      btnOkColor: pendingColor,
      btnOkOnPress: () {
        debugPrint('Dompet Digital Dalam Pengembangan');
      },
      onDissmissCallback: () {
        debugPrint('Dompet Digital Dalam Pengembangan');
      },
    )..show();
  }

  void displayBottomSheet(BuildContext context) {
    SizeConfig().init(context);
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      context: context,
      builder: (ctx) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(defaultPadding),
            vertical: getProportionateScreenHeight(defaultPadding),
          ),
          height: 50.0.h,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pilih Metode Pembayaran',
                    style: TextStyle(
                      fontSize: bodyText2.sp,
                      color: secondaryTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  _buildRadioButton(),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              displayAwesomeDialogue();
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: primaryColor,
                                  width: 5,
                                ),
                              ),
                              child: Image.asset(
                                "assets/images/virtual-payment-dana.png",
                                fit: BoxFit.cover,
                                height: 50.0,
                                width: 50.0,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              displayAwesomeDialogue();
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: primaryColor,
                                  width: 5,
                                ),
                              ),
                              child: Image.asset(
                                "assets/images/virtual-payment-ovo.png",
                                fit: BoxFit.cover,
                                height: 50.0,
                                width: 50.0,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              displayAwesomeDialogue();
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: primaryColor,
                                  width: 5,
                                ),
                              ),
                              child: Image.asset(
                                "assets/images/virtual-payment-linkaja.png",
                                fit: BoxFit.cover,
                                height: 50.0,
                                width: 50.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.item.namaParkir,
                                style: TextStyle(
                                  fontSize: bodyText2.sp,
                                  color: secondaryTextColor,
                                  fontWeight: FontWeight.w800,
                                ),
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                              ),
                              Text(
                                widget.item.lokasiParkir,
                                style: TextStyle(
                                  fontSize: caption.sp,
                                  color: secondaryTextColor,
                                ),
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.item.jam,
                              style: TextStyle(
                                fontSize: caption.sp,
                                color: secondaryTextColor,
                              ),
                              overflow: TextOverflow.clip,
                              maxLines: 2,
                            ),
                            Text(
                              'Rp. ' + widget.item.harga.toString(),
                              style: TextStyle(
                                fontSize: caption.sp,
                                color: secondaryTextColor,
                              ),
                              overflow: TextOverflow.clip,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(defaultPadding),
                    ),
                    child: Column(
                      children: [
                        payButton(context),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget payButton(BuildContext context) {
    return ElevatedButton(
      child: Text(
        'Pilih Pembayaran',
        style: TextStyle(
          fontSize: caption.sp,
          color: primaryTextColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        elevation: 5,
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(80),
          vertical: getProportionateScreenHeight(17),
        ),
        shape: new RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _buildRadioButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _filterList
          .map(
            (filterMap) => RadioListTile(
              title: Text(filterMap.text),
              value: filterMap.index,
              groupValue: _filterGroup,
              dense: false,
              onChanged: (value) {
                setState(
                  () {
                    _filterGroup = value;
                  },
                );
                Navigator.pop(context);
              },
            ),
          )
          .toList(),
    );
  }
}

class RadioGroup {
  final int index;
  final String text;
  RadioGroup({
    this.index,
    this.text,
  });
}
