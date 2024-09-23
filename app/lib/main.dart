import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QueryCraft',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 30, 30, 30)),
        useMaterial3: true,
      ),
      home: const MainPage()
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, dynamic>> dbConnections = [];

  @override
  void initState() {
    super.initState();
    fetchDBConnections();
  }

  Future<void> fetchDBConnections() async {
    dbConnections = [
      {
        'connectionName': 'Product Sales',
        'dbType': 'postgres',
        'keywords': ['Finance', 'Business', 'Sales'],
        'createdAt': "09/23/2023"
      },
      {
        'connectionName': 'Customer Info',
        'dbType': 'mongo',
        'keywords': ['Users', 'Record Keeping'],
        'createdAt': '10/15/2023'
      },
      {
        'connectionName': 'Employee Expenses',
        'dbType': 'postgres',
        'keywords': ['Finances', 'Management', 'People Ops'],
        'createdAt': '11/20/2023'
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double mainPadding = width > 1500 ? width * 0.3 : width * 0.1;
    double tableWidth = width > 1000 ? 150 : 100;
    double tableFontSize = width > 1000 ? 13 : 12;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.gavel,
                        color: Colors.white
                      ),
                      SizedBox(width: 5),
                      Text(
                        "QueryCraft",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        )
                      )
                    ],
                  )
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mainPadding),
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 300,
                        child: Text(
                          "Query your databases with RAG AI.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24
                          ),
                        )
                      )
                    ),
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 600,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              SizedBox(width: tableWidth, child: Text("Product Category", style: TextStyle(color: Colors.white, fontSize: tableFontSize))),
                              SizedBox(width: tableWidth, child: Text("Product Name", style: TextStyle(color: Colors.white, fontSize: tableFontSize))),
                              SizedBox(width: tableWidth, child: Text("Retail Price", style: TextStyle(color: Colors.white, fontSize: tableFontSize))),
                              SizedBox(width: tableWidth, child: Text("Units Sold", style: TextStyle(color: Colors.white, fontSize: tableFontSize)))
                            ],
                          )
                        ),
                      )
                    ),
                    const RowData(data: ['Dress Shirts', 'Linen Shirt', '\$59.99', '436'], isLast: false),
                    const RowData(data: ['Hoodies', 'Graphic Hoodie', '\$49.99', '213'], isLast: false),
                    const RowData(data: ['Sneakers', 'Low-Top Sneaker', '\$79.99', '654'], isLast: true),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 700,
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 26, 26, 26),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 121, 121, 121),
                              width: 2,
                            ),
                          ),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: TerminalTyper(
                                message: "How may I assist you today?",
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'MenloReg',
                                  color: Colors.white,
                                ),
                              )
                            )
                          )
                        )
                      )
                    ),
                    const SizedBox(height: 60),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 300,
                        child: Row(
                          children: [
                            const Text(
                              "Your DB Connections",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,

                              ),
                              child: IconButton(
                                icon: const Icon(Icons.add, size: 15),
                                color: const Color.fromARGB(255, 30, 30, 30),
                                onPressed: () {
                                  
                                },
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                              )
                            ),
                          ],
                        )
                      )
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: dbConnections.map((connection) {
                        return DBCard(
                          dbInfo: connection,
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 80),
                  ],
                )
              )
            )
          ],
        )
      )
    );
  }
}

class TerminalTyper extends StatefulWidget {
  final String message;
  final TextStyle textStyle;

  const TerminalTyper({
    super.key,
    required this.message,
    required this.textStyle
  });

  @override
  State<TerminalTyper> createState() => _TerminalTyperState();
}

class _TerminalTyperState extends State<TerminalTyper> with SingleTickerProviderStateMixin {
  String displayedText = '';
  int charPosition = 0;
  late Timer timer;
  late AnimationController cursorBlinkController;
  late Animation<double> cursorBlinkAnimation;

  @override
  void initState() {
    super.initState();
    cursorBlinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500)
    );

    cursorBlinkAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(cursorBlinkController)
      ..addListener(() {
        setState(() {
          
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          cursorBlinkController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          cursorBlinkController.forward();
        }
      });

    cursorBlinkController.forward();
    typing();
  }

  void typing() {
    displayedText = '> ';
    charPosition = 0;
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (charPosition < widget.message.length) {
        setState(() {
          displayedText += widget.message[charPosition];
          charPosition++;
        });
      } else {
        timer.cancel();
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            typing();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showCursor = cursorBlinkAnimation.value > 0.5;

    return Text(
      "${displayedText}${showCursor ? '_' : ''}",
      style: widget.textStyle
    );
  }
}

class RowData extends StatefulWidget {
  final List<String> data;
  final bool isLast;

  const RowData({
    Key? key,
    required this.data,
    required this.isLast
  }) : super(key: key);

  @override
  State<RowData> createState() => _RowDataState();
}

class _RowDataState extends State<RowData> {
  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double tableWidth = width > 1000 ? 150 : 100;
    double tableFontSize = width > 1000 ? 13 : 12;

    Gradient gradient = LinearGradient(
      colors: [Colors.grey, widget.isLast ? const Color.fromARGB(255, 30, 30, 30) : Colors.grey],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter
    );

    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 600,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: widget.data.map((text) => SizedBox(
              width: tableWidth,
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => gradient.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height)
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: tableFontSize
                  )
                )
              )
            )).toList(),
          )
        )
      )
    );
  }
}

class DBCard extends StatefulWidget {
  final Map<String, dynamic> dbInfo;
  
  const DBCard({
    super.key,
    required this.dbInfo
  });

  @override
  State<DBCard> createState() => _DBCardState();
}

class _DBCardState extends State<DBCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    var imagePath;
    if (widget.dbInfo['dbType'] == 'postgres') {
      imagePath = 'assets/images/postgres.jpg';
    } else if (widget.dbInfo['dbType'] == 'mongo') {
      imagePath = 'assets/images/mongo.png';
    }

    Color backgroundColor = isHovered ? const Color.fromARGB(255, 82, 82, 82) : const Color.fromARGB(255, 72, 72, 72); // Lighter color when hovered

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 100,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CircleAvatar(
                  backgroundImage: AssetImage(imagePath),
                  radius: 30
                ),
              )

            ]
          )
        ),
        onTap: () {

        },
      )
    );
  }
}
