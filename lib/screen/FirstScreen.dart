import 'package:flutter/material.dart';
import 'package:kuva/enums.dart';
import 'package:kuva/models/menu_info.dart';
import 'package:kuva/screen/settings_screen.dart';
import 'package:kuva/views/homepage.dart';
import 'package:provider/provider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:camera/camera.dart';
import 'kuvacamera.dart';

class FirstScreen extends StatefulWidget {
  String image;
  String title;
  List holder;
  List ttlist;
  List imgList;
  List audioList;
  static bool flag=true;
  FirstScreen(this.image, this.title, this.holder, this.ttlist, this.imgList,
      this.audioList);

  @override
  State<StatefulWidget> createState() {
    return _FirstScreen();
  }
}

class _FirstScreen extends State<FirstScreen> {
  
  PageController pageController = PageController(initialPage: 0);
  int index = 4;
  
  bool _isFavorited = true;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  onPlayAudio(String name) async {
    setState(() {
      AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
      assetsAudioPlayer.open(Audio(name));
    });
  }

  @override
  Widget build(BuildContext context) {
    binding();
        return MaterialApp(
    
      home: Scaffold(
        resizeToAvoidBottomInset : true,
          appBar: AppBar(
            title: Text('Affirmations'),
            elevation: 0,
            backgroundColor: Color.fromRGBO(102, 70, 75, 1),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
                },
              ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
          backgroundColor: Color.fromRGBO(75, 53, 56, 1),
          body: Container(
                    child: PageView(
            controller: pageController,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              for (var i = 0; i < widget.holder.length; i++)
                Expanded(
                                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
          widget.ttlist[i],
          style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold),
                      ),
                      // Image.network(
                      //   widget.imgList[i],
                      //   height: 500,
                      //   width: 350,
                      //   fit: BoxFit.cover,
                      // ),
                     
                       FirstScreen.flag==false ?
                       Demo(): Image.network(
           widget.imgList[i],
           height: 400,
           width: 350,
          fit: BoxFit.cover,
                     ),
                      SizedBox(
          height: 16.0,
                      ),
                      Expanded(
                                              child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(45, 35, 36, 1),
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0),
              )),
          height: 200,
          width: 500,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                        height: 5.0,
                    ),
                    Expanded(
                                            child: Text(
                          widget.holder[i],
                          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2.0,
            fontSize: 30.0),
                        ),
                    ),
                    Row(
                        children: [
           FloatingActionButton(
            heroTag: "btn4",
            onPressed: () {
              setState(() {
                  FirstScreen.flag=!FirstScreen.flag;
          
              });
                  
            },
            child: Icon(Icons.camera),
            backgroundColor:
                  Color.fromRGBO(102, 70, 75, 1),
            foregroundColor: Colors.white,
          ),
          Spacer(flex: 2),
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () =>
                  onPlayAudio(widget.audioList[i]),
            child: Icon(Icons.music_note),
            backgroundColor:
                  Color.fromRGBO(102, 70, 75, 1),
            foregroundColor: Colors.white,
          ),
          Spacer(flex: 2),
          FloatingActionButton.extended(
            heroTag: "btn2",
            onPressed: () {
              
              Navigator.push(
                  context,
                  MaterialPageRoute(
                        builder: (context) =>
            ChangeNotifierProvider<
                  MenuInfo>(
              create: (context) =>
                    MenuInfo(
                          MenuType.clock),
              child: HomePage(),
            )),
              );
            },
            icon: Icon(Icons.alarm),
            backgroundColor:
                  Color.fromRGBO(102, 70, 75, 1),
            foregroundColor: Colors.white,
            label: Text("Alarm"),
          ),
                        ],
                    ),
                  ],
              ),
            ),
          ),
                        ),
                      ),
          
                      
              
                    ],
                  ),
                ),
            ]),
                  )),
    );
  }
}
List<CameraDescription> cameras;


class Square extends StatefulWidget {
  final color;
  final size;

  Square({this.color, this.size});

  @override
  _SquareState createState() => _SquareState();
}

class _SquareState extends State<Square> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[1], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller));
  }
  
}

class Demo extends StatelessWidget {

  static var  flag=0;
  build(context) {
   
    
     
    return Container(
      margin: EdgeInsets.only(bottom: 20, right: 20),
     height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
           //   borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                width: 350,
                height: 500,
                decoration: BoxDecoration(
                 // border: Border.all(width: 10, color: Colors.black),
                ),
                // margin: EdgeInsets.only(bottom: 30),
                child: Square(),
              ),
            ),
          ),
          // Square(),
        ],
      ),
    );
  }
}
Future<void>binding() async
{
 WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  Demo.flag=2;
}

