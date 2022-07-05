import "package:flutter/material.dart";

class AdminTabBar extends StatelessWidget {
  const AdminTabBar({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TabBar(
        controller: _tabController,
        isScrollable: false,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            25.0,
          ),
          color: Theme.of(context).primaryColor,
          border: Border.all(color: Colors.black12),
        ),
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: "Nunito",
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelColor: Colors.black45,
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontFamily: "Nunito",
          fontWeight: FontWeight.w600,
        ),
        tabs: [
          Tab(
            text: "Accounts",
          ),
          Tab(
            text: "Units",
          ),
        ],
      ),
    );
  }
}
