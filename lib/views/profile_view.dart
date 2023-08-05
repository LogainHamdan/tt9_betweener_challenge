import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileView extends StatelessWidget {
  static String id = '/profileView';

  const ProfileView({super.key});
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Profile",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 12,
            ),

            ///personal info Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  left: 20, right: 12, top: 12, bottom: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xff2D2B4E)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  const CircleAvatar(
                    radius: 45,
                    child:
                        Icon(Icons.person, size: 45, color: Color(0xff2D2B4E)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Johan Doe",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            "example",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Text(
                          "example",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            buildContainer(text: "follower 203"),
                            SizedBox(
                              width: 8,
                            ),
                            buildContainer(text: 'following 100')
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.edit,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),

            ///Links
            FutureBuilder(
              future: getLinks,
              builder: (context, snapshot) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 24),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xffFEE2E7)),
                          child: Text(snapshot.data![index].title),
                        );
                      }),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xff2D2B4E),
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer({required String text}) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: const Color(0xffFFD465),
          borderRadius: BorderRadius.circular(8)),
      child: Text(text),
    );
  }
}
