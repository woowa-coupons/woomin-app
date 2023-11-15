import 'package:flutter/material.dart';
import 'package:woomin/models/promotion_model.dart';
import 'package:woomin/screens/event_detail_screen.dart';
import 'package:woomin/services/api.dart';
import 'package:woomin/widgets/promotion_widget.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late Future<List<PromotionModel>> promotions;

  @override
  void initState() {
    super.initState();
    promotions = ApiService.getPromotionList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text('이벤트',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: FutureBuilder(
            future: promotions,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    for (var promotion in snapshot.data!)
                      Promotion(
                          promotion: promotion,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventWebViewScreen(
                                    promotionUrl: promotion.promotionPageUrl),
                              ),
                            );
                          })
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
