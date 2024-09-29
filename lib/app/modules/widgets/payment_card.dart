import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utill/app_colors.dart';
import '../utill/app_size.dart';
import '../utill/sql_card_helper.dart';

Widget customPaymentCard(int id) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Credit card or Debit card",
              //"${Cardjournals[index]["cardIssuer"]}",//cardIssuer
              style: GoogleFonts.gothicA1(
                color: AppColors.colorLightBlack,
                fontSize: screenHeight * 0.016,
              ),
            ),
            Text(
              "{Cardjournals[index][cardHolderName]}",
              style: GoogleFonts.gothicA1(
                color: AppColors.colorLightBlack,
                fontSize: screenHeight * 0.013,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Card no : {Cardjournals[index][cardNumber]}",
                  style: GoogleFonts.gothicA1(
                    color: AppColors.colorLightBlack,
                    fontSize: screenHeight * 0.013,
                  ),
                ),
                // Text(
                //   " 2119 X X X X X X 998 ",
                //   style: GoogleFonts.gothicA1(
                //     color: AppColors.colorLightBlack,
                //     fontSize: screenHeight * 0.013,
                //   ),
                // ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Exp : {Cardjournals[index][validity]}",
                  style: GoogleFonts.gothicA1(
                    color: AppColors.colorLightBlack,
                    fontSize: screenHeight * 0.013,
                  ),
                ),
                // Text(
                //   "  05/25",
                //   style: GoogleFonts.gothicA1(
                //     color: AppColors.colorLightBlack,
                //     fontSize: screenHeight * 0.013,
                //   ),
                // ),
              ],
            )
          ],
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(right: screenWidth * 0.020),
          child: SvgPicture.asset(
            "assets/images/visa_card.svg",
            height: screenHeight * 0.030,
            width: screenWidth * 0.070,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: screenWidth * 0.020),
          child: Icon(
            Icons.edit,
            color: AppColors.colorGrey,
            size: screenHeight * 0.022,
          ),
        ),
        InkWell(
          onTap: () {
            SQLCardHelper.deleteItem(id);
          },
          child: Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.020),
            child: Icon(
              Icons.delete_outlined,
              color: AppColors.colorGrey,
              size: screenHeight * 0.022,
            ),
          ),
        )
      ],
    ),
  );
}
