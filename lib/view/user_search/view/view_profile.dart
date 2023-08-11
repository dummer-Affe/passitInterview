import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passit/core/states/app_fonts/font_sizer.dart';
import 'package:passit/view/user_search/view/information_row.dart';

import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../../../product/model/dummy_profile/dummy_profile_response.dart';

class ViewProfile extends StatelessWidget {
  final DummyProfileResponse user;
  const ViewProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: FontSizer(mobile: context.width * 0.9, mid: 500, large: 800).size,
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                "User Informations:",
                style: AppFontsPanel.descriptionTitle,
              )),
          const SizedBox(
            height: 50,
          ),
          InformationRow(title: "First Name", answer: user.firstName),
          InformationRow(title: "Last Name", answer: user.lastName),
          InformationRow(title: "Maiden Name", answer: user.maidenName),
          InformationRow(title: "Adress", answer: user.address!.address),
          InformationRow(title: "City", answer: user.address!.city!),
          InformationRow(
              title: "Postal Code", answer: user.address!.postalCode),
          InformationRow(title: "State", answer: user.address!.state),
          InformationRow(
              title: "Coor lat", answer: user.address!.coordinates!.lat),
          InformationRow(
              title: "Coor lang", answer: user.address!.coordinates!.lng),
          InformationRow(title: "Card Expire", answer: user.bank!.cardExpire),
          InformationRow(title: "Card Number", answer: user.bank!.cardNumber),
          InformationRow(title: "Card Type", answer: user.bank!.cardType),
          InformationRow(title: "Card Currency", answer: user.bank!.currency),
          InformationRow(title: "Card Iban", answer: user.bank!.iban),
          InformationRow(title: "Age", answer: user.age),
          InformationRow(title: "Birthdate", answer: user.birthDate),
          InformationRow(title: "Blood Group", answer: user.bloodGroup),
          InformationRow(
              title: "Company Address", answer: user.company!.address!.address),
          InformationRow(
              title: "Company City", answer: user.company!.address!.city),
          InformationRow(
              title: "Company Postal Code",
              answer: user.company!.address!.postalCode),
          InformationRow(
              title: "Company State", answer: user.company!.address!.state),
          InformationRow(
              title: "Company Coordinates Lat",
              answer: user.company!.address!.coordinates!.lat),
          InformationRow(
              title: "Company Coordinates Lng",
              answer: user.company!.address!.coordinates!.lng),
          InformationRow(
              title: "Company Department", answer: user.company!.department),
          InformationRow(title: "Company Name", answer: user.company!.name),
          InformationRow(title: "Company Title", answer: user.company!.title),
          InformationRow(title: "Domain", answer: user.domain),
          InformationRow(title: "Ein", answer: user.ein),
          InformationRow(title: "Email", answer: user.email),
          InformationRow(title: "Eye Color", answer: user.eyeColor),
          InformationRow(title: "Gender", answer: user.gender),
          InformationRow(title: "Hair Color", answer: user.hair!.color),
          InformationRow(title: "Hair Type", answer: user.hair!.type),
          InformationRow(title: "Height", answer: user.height),
          InformationRow(title: "Id", answer: user.id),
          InformationRow(title: "Ip", answer: user.ip),
          InformationRow(title: "Mac Address", answer: user.macAddress),
          InformationRow(title: "Password", answer: user.password),
          InformationRow(title: "Phone", answer: user.phone),
          InformationRow(title: "Ssn", answer: user.ssn),
          InformationRow(title: "University", answer: user.university),
          InformationRow(title: "User Agent", answer: user.userAgent),
          InformationRow(title: "Username", answer: user.username),
          InformationRow(title: "Weight", answer: user.weight),
        ],
      ),
    );
  }
}
