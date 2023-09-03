import 'package:flutter/material.dart';
import 'package:guven_future/user_interface/helper/color.dart';
import 'package:guven_future/user_interface/style/text_third.dart';
import 'package:guven_future/user_interface/style/text_secondary.dart';

class TableDualRow extends StatelessWidget {
  final String? title;
  final double fontSize;
  final double vertical;
  final String? subTitle;
  final Color borderColor;
  final double borderOpacity;
  final double columnWidthOne;
  final double columnWidthTwo;
  final Alignment alignmentTwo;
  final String? tooltipMessage;
  final double marginHorizontal;

  const TableDualRow({
    Key? key,
    this.title,
    this.subTitle,
    this.vertical = 2,
    this.fontSize = 15,
    this.columnWidthTwo = 4,
    this.tooltipMessage = "",
    this.columnWidthOne = 1.8,
    this.borderOpacity = 0.025,
    this.marginHorizontal = 10,
    this.borderColor = greyColor,
    this.alignmentTwo = Alignment.centerLeft}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: marginHorizontal,vertical: vertical),
      child: Column(
        children: [
          Table(

            columnWidths: {
              0: FlexColumnWidth(columnWidthOne),
              1: FlexColumnWidth(columnWidthTwo) },

            border: TableBorder.all(color:borderColor.withOpacity(borderOpacity)),
            children: [
              TableRow(
                  children: [
                    Tooltip(
                      message: tooltipMessage,
                      child: Container(
                          margin: const EdgeInsets.all(7),
                          child: Text(title!,style: textStyleSecondary(15)
                      )),
                    ),

                    Container(
                        alignment:alignmentTwo,
                        margin: const EdgeInsets.all(7),
                        child: Text(subTitle!,style: textStyleThird(14) ))
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
