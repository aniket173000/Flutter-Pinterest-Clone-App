import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PinterestNavBar extends StatefulWidget {
  PinterestNavBar({
    Key key,
    @required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  _PinterestNavBarState createState() => _PinterestNavBarState();
}

class _PinterestNavBarState extends State<PinterestNavBar> {
  final kBackground = Colors.white;
  final kBackgroundCompatible = Colors.black;
  final kIconColorLight = Colors.grey.shade200;
  final kIconColorDark = Colors.grey.shade600;

  int tabSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0.0,
        backgroundColor: Colors.white,
        leading:Image.asset('IMAGES/download.png',fit: BoxFit.cover,height: 50,),
        title: Row(
          children: [
            _buildNavButton('Home', 0),
            _buildNavButton('Today', 1),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: SizedBox(
                height: 40.0,
                child: _buildSearchBar(),
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              Center(child: _buildIcon(
                FontAwesomeIcons.solidBell,
                hoverColor: Colors.red,
              )),
              NotificationBadge(1),
            ],
          ),
          _buildIcon(
            FontAwesomeIcons.solidCommentDots,
            hoverColor: Colors.lightBlueAccent,
          ),
          InkWell(
            hoverColor: Colors.pink,
            onTap: () {},
            child: CircleAvatar(
              radius: 16.0,
              backgroundColor: kIconColorLight,
              child: Text(
                'M',
                style: TextStyle(
                  color: kBackgroundCompatible,
                ),
              ),
            ),
          ),
          _buildIcon(FontAwesomeIcons.caretDown)
        ],
      ),
      body: widget.body,
    );
  }

  Widget _buildNavButton(String text, int value) {
    final bool isSelected = tabSelected == value;
    return InkWell(
      splashColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: () {
        setState(() {
          tabSelected = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          color: isSelected ? kBackgroundCompatible : kBackground,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? kBackground : kBackgroundCompatible,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 4.0,
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
        prefixIcon: Icon(
          Icons.search,
          color: kIconColorDark,
        ),
        hintText: 'Search',
        hintStyle: TextStyle(
          color: kIconColorDark,
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, {Color hoverColor = Colors.green}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: IconButton(
        icon: Icon(icon),
        color: kIconColorDark,
        hoverColor: hoverColor,
        disabledColor: kIconColorDark,
        onPressed: () {},
      ),
    );
  }
}

class NotificationBadge extends StatelessWidget {
  NotificationBadge(this.counter);
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: counter != 0,
      child: Positioned(
        top: 12.0,
        right: 12.0,
        child: Container(
          child: Center(
            child: Text(
              '$counter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          constraints: BoxConstraints.expand(
            height: 14,
            width: 14,
          ),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}