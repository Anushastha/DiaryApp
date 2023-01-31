import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/Screens/Dashboard/card_styles.dart';
import 'package:flutter/material.dart';

Widget entryCard(Function()? onTap, QueryDocumentSnapshot doc){
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: CardStyles.CardColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["title"],
            style: CardStyles.mainTitle,
          ),
          SizedBox(height: 4.0),
          Text(
            doc["creation_date"],
            style: CardStyles.date,
          ),
          SizedBox(height: 8.0),
          Text(
            doc["content"],
            style: CardStyles.mainContent,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}