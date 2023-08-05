import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/controllers/link_controller.dart';
import 'package:tt9_betweener_challenge/controllers/user_controller.dart';

import '../constants.dart';
import '../models/links.dart';
import '../models/user.dart';

class HomeView extends StatefulWidget {
  static String id = '/homeView';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<User> user;
  late Future<List<Link>> links;

  @override
  void initState() {
    user = getLocalUser();
    links = getLinks(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder(
          future: user,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                'Hello, ${snapshot.data?.user?.name}!',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              );
            }
            return const Text('loading');
          },
        ),
        FutureBuilder(
          future: links,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search_rounded)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.qr_code_scanner)),
                    ],
                  ),
                  ListView.separated(
                      padding: const EdgeInsets.all(12),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final link = snapshot.data?[index].title;
                        return Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: kLinksColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                            title: Text('$link'),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 8,
                        );
                      },
                      itemCount: snapshot.data!.length),
                ],
              );
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Text('loading');
          },
        ),
      ],
    );
  }
}
