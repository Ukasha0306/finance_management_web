import 'package:flutter/material.dart';

import '../resources/colors.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: const Row(
        children: [
          Text("Dashboard"),
          Spacer(
            flex: 2,
          ),
          SearchField(),
          NotificationContainer(),
          ProfileCard(),

        ],
      ),
    );
  }
}



class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          fillColor: AppColor.backgroundGrey,
          filled: true,
          hintText: "Search here",
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: AppColor.backgroundGrey,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: const Icon(
        Icons.notifications,
        color: Colors.grey,
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          minRadius: 20,
          backgroundImage:AssetImage('assets/profilePic.jpeg',),

        ),
        SizedBox(width: 20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ukasha", style: TextStyle(fontWeight: FontWeight.w600, height: 2),),
            Text("Ukasha0306@gmail.com", style: TextStyle(color: Colors.black54),)

          ],
        ),
      ],
    );

  }
}
