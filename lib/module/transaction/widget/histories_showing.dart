import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sims_ppob_ripaldiansyah/core.dart';

class HistoriesShowing extends StatefulWidget {
  const HistoriesShowing({
    super.key,
    required this.state,
    required this.controller,
  });

  final TransactionState state;
  final TransactionController controller;

  @override
  _HistoriesShowingState createState() => _HistoriesShowingState();
}

class _HistoriesShowingState extends State<HistoriesShowing> {
  @override
  Widget build(BuildContext context) {
    int itemCount = widget.state.getHistories?.data?.records?.length ?? 0;

    return Expanded(
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            if (itemCount == 0) const SizedBox(height: 100.0),
            if (itemCount == 0)
              Expanded(
                child: Text(
                  "Maaf tidak ada histori transaksi saat ini",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xffd6d2d2),
                  ),
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: itemCount,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  bool isPayment = widget.state.getHistories!.data!
                          .records![index].transactionType ==
                      "PAYMENT";
                  String totalAmount = NumberFormat('#,##0', 'id_ID').format(
                      widget.state.getHistories!.data!.records![index]
                          .totalAmount);
                  String description = widget
                      .state.getHistories!.data!.records![index].description!;
                  String transactionDate = DateFormat("d MMMM yyyy HH:mm 'WIB'")
                      .format(widget.state.getHistories!.data!.records![index]
                          .createdOn!);
                  return Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            border: Border.all(
                              width: 1.0,
                              color: Color(0xffe2dede),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0, right: 15.0, top: 5),
                                child: Row(
                                  children: [
                                    Icon(
                                      isPayment ? Icons.remove : Icons.add,
                                      size: 14.0,
                                      color: isPayment
                                          ? primaryColor
                                          : Color(0xff44b88b),
                                    ),
                                    Text(
                                      "Rp.${totalAmount}",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: isPayment
                                            ? primaryColor
                                            : Color(0xff44b88b),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "${description}",
                                      style: TextStyle(
                                        fontSize: 9.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 20.0, bottom: 10),
                                child: Text(
                                  "${transactionDate}",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Color(0xffe2dede),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if ((itemCount == index + 1) &&
                            (itemCount % 5 == 0) &&
                            !widget.state.isLoadHistories &&
                            !widget.state.isRecordsNull)
                          InkWell(
                            onTap: () {
                              widget.controller.showMore();
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Show More",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        if (widget.state.getHistories!.data!.records!.length ==
                                index + 1 &&
                            widget.state.isLoadHistories)
                          CircularProgressIndicator(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
