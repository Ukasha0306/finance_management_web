
import 'package:flutter/material.dart';
import '../model/transaction_data.dart';
import '../resources/colors.dart';


class LatestTransaction extends StatelessWidget {
  const LatestTransaction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColor.whiteCard,
        borderRadius: BorderRadius.all(Radius.circular(10),),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const Text(
                "Latest Transaction",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "View All",
                  style: TextStyle(
                      color: AppColor.blueColor,
                      fontWeight: FontWeight.w500),
                ),),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
                columnSpacing: 16,
                horizontalMargin: 0,
                columns:  [
                  DataColumn(
                    label:Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) { },),
                        const Text("To/Form")
                      ],
                    ),
                  ),

                  const DataColumn(
                    label:Text("Date"),
                  ),
                  const DataColumn(
                    label:Text("Description"),
                  ),
                  const DataColumn(
                    label:Text("Amount"),
                  ),
                  const DataColumn(
                    label:Text("Status"),
                  ),
                  const DataColumn(
                    label:Text("Action"),
                  ),
                ],
                rows: List.generate(transactionDataDetails.length,
                        (index) => recentData(transactionDataDetails[index]),),
            ),
          ),
        ],
      ),
    );
  }

  DataRow recentData(TransactionData fileInfo) {
    return DataRow(cells: [
              DataCell(
                Row(
                  children: [
                    Checkbox(value: fileInfo.checked, onChanged: (value){}),
                     Text(fileInfo.title),
                  ],
                ),
              ),
               DataCell(
                Text(fileInfo.date),
              ),
               DataCell(
                Text(fileInfo.description),
              ),
               DataCell(
                Text(fileInfo.amount),
              ),
              DataCell(Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.green),
                  borderRadius: const BorderRadius.all(Radius.circular(10),),
                ),
                child:  Text(fileInfo.status, style: const TextStyle(color: Colors.green),),
              ),),
              const DataCell(Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.link),
                  Icon(Icons.delete),
                  Icon(Icons.more_horiz),
                ],
              ))

            ]);
  }
}