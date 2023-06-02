import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';

class BadgesExample extends StatefulWidget {
  const BadgesExample({super.key});

  @override
  createState() => _BadgesExampleState();
}

class _BadgesExampleState extends State<BadgesExample> {
  int _counter = 0;
  bool showElevatedButtonBadge = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: _bottomNavigationBar(),
        appBar: AppBar(
          leading: badge.Badge(
            position: badge.BadgePosition.topEnd(top: 10, end: 10),
            badgeContent: null,
            child: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ),
          title:
              const Text('Badge Demo', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          actions: <Widget>[
            _shoppingCartBadge(),
          ],
          bottom: _tabBar(),
        ),
        body: Column(
          children: <Widget>[
            _addRemoveCartButtons(),
            _textBadge(),
            _directionalBadge(),
            _elevatedButtonBadge(),
            _chipWithZeroPadding(),
            expandedBadge(),
            _badgeWithZeroPadding(),
            _badgesWithBorder(),
            _listView(),
          ],
        ),
      ),
    );
  }

  Widget expandedBadge() {
    return const Expanded(
      child: Center(
        child: badge.Badge(
          badgeContent: Text('10'),
          child: Icon(Icons.person, size: 30),
        ),
      ),
    );
  }

  Widget _shoppingCartBadge() {
    return badge.Badge(
      position: badge.BadgePosition.topEnd(top: 0, end: 3),

      // animationDuration: const Duration(milliseconds: 300),
      // animationType: badge.BadgeAnimationType.slide,
      badgeContent: Text(
        _counter.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      child:
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
    );
  }

  PreferredSizeWidget _tabBar() {
    return TabBar(tabs: [
      const Tab(
        icon: badge.Badge(
          badgeStyle: badge.BadgeStyle(
            badgeColor: Colors.blue,
          ),
          badgeContent: Text(
            '3',
            style: TextStyle(color: Colors.white),
          ),
          child: Icon(Icons.account_balance_wallet, color: Colors.grey),
        ),
      ),
      Tab(
        icon: badge.Badge(
          badgeStyle: badge.BadgeStyle(
            shape: badge.BadgeShape.square,
            padding: const EdgeInsets.all(2),
            borderRadius: BorderRadius.circular(5),
          ),
          position: badge.BadgePosition.topEnd(top: -12, end: -20),
          badgeContent: const Text(
            'NEW',
            style: TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
          child: Text(
            'MUSIC',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      ),
    ]);
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(
          label: 'Events',
          icon: Icon(Icons.event),
        ),
        const BottomNavigationBarItem(
          label: 'Messages',
          icon: Icon(Icons.message),
        ),
        BottomNavigationBarItem(
          label: 'Settings',
          icon: badge.Badge(
            badgeStyle: badge.BadgeStyle(
              shape: badge.BadgeShape.circle,
              borderRadius: BorderRadius.circular(100),
            ),
            position: badge.BadgePosition.center(),
            badgeContent: Container(
              height: 5,
              width: 5,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            ),
            child: const Icon(Icons.settings),
          ),
        ),
      ],
    );
  }

  Widget _addRemoveCartButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              icon: const Icon(Icons.add),
              label: const Text('Add to cart')),
          ElevatedButton.icon(
              onPressed: () {
                if (_counter > 0) {
                  setState(() {
                    _counter--;
                  });
                }
              },
              icon: const Icon(Icons.remove),
              label: const Text('Remove from cart')),
        ],
      ),
    );
  }

  Widget _textBadge() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: badge.Badge(
        badgeStyle: const badge.BadgeStyle(
            padding: EdgeInsets.all(6),
            badgeGradient: badge.BadgeGradient.linear(colors: [
              Colors.black,
              Colors.red,
            ])),
        badgeContent: const Text(
          '!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        position: badge.BadgePosition.topStart(top: -15),
        child: const Text('This is a text'),
      ),
    );
  }

  Widget _elevatedButtonBadge() {
    return badge.Badge(
      showBadge: showElevatedButtonBadge,
      badgeStyle: const badge.BadgeStyle(
        padding: EdgeInsets.all(8),
        badgeColor: Colors.deepPurple,
      ),
      badgeContent: const Text(
        '!',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            showElevatedButtonBadge = !showElevatedButtonBadge;
          });
        },
        child: const Text('Raised Button'),
      ),
    );
  }

  Widget _chipWithZeroPadding() {
    return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Chip with zero padding:'),
          Chip(
            label: Text('Hello'),
            padding: EdgeInsets.all(0),
          ),
        ]);
  }

  Widget _badgeWithZeroPadding() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Badges:'),
        for (int i = 0; i < 5; i++)
          _getExampleBadge(padding: (i * 2).toDouble())
      ],
    );
  }

  Widget _getExampleBadge({double? padding}) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: badge.Badge(
        badgeStyle: badge.BadgeStyle(
          badgeColor: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(20),
          padding: EdgeInsets.all(padding ?? 4),
          shape: badge.BadgeShape.square,
        ),
        badgeContent: const Text(
          'Hello',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _badgesWithBorder() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Badges with borders:'),
          badge.Badge(
            position: badge.BadgePosition.topEnd(top: 0, end: 2),
            badgeStyle: const badge.BadgeStyle(
              elevation: 0,
              shape: badge.BadgeShape.circle,
              badgeColor: Colors.red,
              borderSide: BorderSide(color: Colors.black),
            ),
            child: const Icon(
              Icons.person,
              size: 30,
            ),
          ),
          badge.Badge(
            position: badge.BadgePosition.topEnd(top: -5, end: -5),
            badgeStyle: const badge.BadgeStyle(
              shape: badge.BadgeShape.square,
              badgeColor: Colors.blue,
              elevation: 0,
              borderSide: BorderSide(
                color: Colors.black,
                width: 3,
              ),
            ),
            badgeContent: const SizedBox(
              height: 5,
              width: 5,
            ),
            child: const Icon(
              Icons.games_outlined,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listView() {
    Widget _listTile(String title, String value) {
      return ListTile(
        dense: true,
        title: Text(title, style: const TextStyle(fontSize: 16)),
        trailing: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              badge.Badge(
                badgeStyle: const badge.BadgeStyle(
                  elevation: 0,
                  shape: badge.BadgeShape.circle,
                  padding: EdgeInsets.all(7),
                ),
                badgeContent: Text(
                  value,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.separated(
        itemCount: 3,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return _listTile('Messages', '2');
            case 1:
              return _listTile('Friends', '7');
            case 2:
            default:
              return _listTile('Events', '!');
          }
        },
      ),
    );
  }

  Widget _directionalBadge() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: badge.Badge(
        badgeStyle: const badge.BadgeStyle(
          elevation: 0,
          padding: EdgeInsetsDirectional.only(end: 4),
          badgeColor: Colors.transparent,
        ),
        position: badge.BadgePosition.topEnd(),
        badgeContent: const Icon(Icons.error, size: 16.0, color: Colors.red),
        child: const Text('This is RTL'),
      ),
    );
  }
}
