import 'package:flutter/material.dart';
import 'package:flutter_application_1/navbarr.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<StaggeredTile> _staggeredTiles = [
    const StaggeredTile.count(1, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
   
   
    
    
  ];
  final List<String> _images = [
    'IMAGES/img2.jpg',
    'IMAGES/img1.jpg',
    'IMAGES/gif3.webp',
    'IMAGES/img3.jpg',
    'IMAGES/img4.jpg',
    'IMAGES/img5.jpg',
    'IMAGES/gif2.webp',
    'IMAGES/img6.jpg',
    'IMAGES/img7.jpg',
    'IMAGES/img8.jpg',
    'IMAGES/img9.jpg',
    'IMAGES/img10.jpg',
    'IMAGES/img11.jpg',
    'IMAGES/gif1.webp',
    'IMAGES/img12.jpg',
    'IMAGES/img13.jpg',
    'IMAGES/img14.jpg',
    'IMAGES/img15.jpg',
    'IMAGES/img16.jpg',
    'IMAGES/img17.jpg',
    'IMAGES/img18.jpg',
    'IMAGES/img19.jpg',
    'IMAGES/img20.jpg',

    
    
    

  ];
  List<bool> _imageHovered;

  @override
  void initState() {
    super.initState();
    _imageHovered = [];
    for (int i = 0; i < _images.length; ++i) {
      _imageHovered.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Staggered Image Grid',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: PinterestNavBar(
        body: new Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: new StaggeredGridView.count(
            crossAxisCount: 4,
            staggeredTiles: _staggeredTiles,
            children: _images.asMap().entries.map((e) {
              return InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    _imageHovered[e.key] = value;
                  });
                },
                child: _ImageTile(
                  image: e.value,
                  isHovering: _imageHovered[e.key],
                ),
              );
            }).toList(),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
        ),
      ),
    );
  }
}

class _ImageTile extends StatelessWidget {
  const _ImageTile({
    @required this.image,
    @required this.isHovering,
  });

  final String image;
  final bool isHovering;
  
  static const optionPosRightBase = 10.0;
  static const optionPosDiff = 60.0;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: const Color(0x00000000),
      elevation: 3.0,
      child: Stack(children: [
        Opacity(
          opacity: isHovering ? 0.5 : 1.0,
          child: new Container(
              decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
          )),
        ),
        _buildOption(icon: Icons.language_outlined,right: optionPosRightBase + 0 * optionPosDiff),
        _buildOption(icon: Icons.share_sharp, right: optionPosRightBase + 1 * optionPosDiff),
        _buildOption(icon: Icons.more_vert, right: optionPosRightBase + 2 * optionPosDiff),
        Visibility(
          visible: isHovering,
          child: Positioned(
            child: new InkWell(
              onTap: () {
                print("tapped");
              },
              onHover: (value) {},
              child: new ElevatedButton(
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () {},
              ),
            ),
            top: 10,
            right: 10,
          ),
        )
      ]),
    );
  }

  Widget _buildOption({
    @required IconData icon,
    double bottom = 10,
    double right}) {
    return Visibility(
      visible: isHovering,
      child: Positioned(
        child: Card(
          child: IconButton(
            icon: Icon(icon),
            onPressed: () {},
            hoverColor: Colors.grey,
          ),
        ),
        bottom: bottom,
        right: right,
      ),
    );
  }
}
