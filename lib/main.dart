import 'package:flutter/material.dart';
import 'package:portfolio_web/portfolio_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  var darkMode = false;

  void toggleDarkMode() {
    setState(() {
      darkMode = !darkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = darkMode ? PortfolioTheme.dark() : PortfolioTheme.light();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        darkMode: toggleDarkMode,
        isDark: darkMode,
      ),
    );
  }
}

class Skill {
  final String type;
  final String imagePath;
  final String description;
  final double rating;

  Skill(
      {required this.description,
      required this.type,
      required this.imagePath,
      required this.rating});
}

final mySkills = <Skill>[
  Skill(
      imagePath: "assets/images/flutter.png",
      type: "Frontend Mobile",
      description:
          "Build my Final Year School Projet using this stack for the mobile app ",
      rating: 3.5),
  Skill(
      imagePath: "assets/images/nodejs.png",
      type: "Backend",
      description:
          "Uses nodeJS proffessionally to build backend services and RESTful API using javascript/typescript",
      rating: 4.0),
  Skill(
      imagePath: "assets/images/react.png",
      type: "Web Frontend",
      description:
          "Uses this proffesionaly to make frontend apps that combine with backend sevices written in NodeJS",
      rating: 4.0),
  Skill(
      imagePath: "assets/images/git.png",
      type: "Version Control",
      description:
          "Uses this proffesionally in particular bitbucket with JIRA intergrations",
      rating: 3.0),
  Skill(
      imagePath: "assets/images/mysql.png",
      type: "Database",
      description:
          "Database l am familiar with both on the side and in my work",
      rating: 3.0),
  Skill(
      imagePath: "assets/images/dotnet.png",
      type: "Backend",
      description:
          "One of my favorite stacks though l haven't used it proffessionaly, l do make some fun microservices apps and learn some containerisation tech such as  Docker and ochestration with kubernetes.",
      rating: 4.0),
  Skill(
      imagePath: "assets/images/golang.png",
      type: "Backend",
      description: "Hobbist language l love to experiment with on the side ",
      rating: 3.0),
  Skill(
      imagePath: "assets/images/java.png",
      type: "Backend",
      description:
          "Some side stuff where l learn spring boot and consume API's with various frontend clients",
      rating: 3.0),
];

class MyHomePage extends StatefulWidget {
  final Function darkMode;
  final bool isDark;

  const MyHomePage({Key? key, required this.darkMode, required this.isDark})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          leadingWidth: 80,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "🖐",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Linval M.",
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        widget.darkMode();
                      },
                      color: widget.isDark ? Colors.white : Colors.black,
                      icon: FaIcon(FontAwesomeIcons.moon)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Resume",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Projects",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Contacts",
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
            ),
          ],
          floating: true,
          pinned: true,
          expandedHeight: 400,
          shadowColor: Theme.of(context).appBarTheme.backgroundColor,
          flexibleSpace: FlexibleSpaceBar(
              background: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
            ),
            height: 300,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: 100,
                  left: 100,
                  child: Image(
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                    image: AssetImage(!widget.isDark
                        ? "assets/images/linval.png"
                        : "assets/images/meblack.png"),
                    // color: Theme.of(context).appBarTheme.backgroundColor,
                  ),
                ),
                Positioned(
                  top: 140,
                  left: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: 'Linval Muchapirei -',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                                text:
                                    '\n Software Engineer from Harare,Zimbabwe',
                                style: Theme.of(context).textTheme.headline1)
                          ])),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            width: 40,
                            height: 40,
                            // colorBlendMode: ,

                            image: AssetImage("assets/images/github.png"),
                          ),
                          SizedBox(width: 10),
                          Image(
                            width: 40,
                            height: 40,
                            image: AssetImage("assets/images/linkedin.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                  height: 300.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Center(
                          child: Text("My Skills & Tech Stacks",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold))),
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                          child: Center(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: mySkills.length,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  height: 350,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      // image: DecorationImage(
                                      //   fit: BoxFit.scaleDown,
                                      //   image: AssetImage(
                                      //       mySkills[index].imagePath),
                                      // ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Image(
                                            image: AssetImage(
                                                mySkills[index].imagePath)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Center(
                                            child: Wrap(children: [
                                          Text(mySkills[index].description,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      color: Colors.black)),
                                        ])),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          children: [
                                            Text('Level',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1!
                                                    .copyWith(
                                                        fontSize: 16,
                                                        color: Colors.black)),
                                            Container(
                                              width: 240,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: 240,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.grey),
                                                  ),
                                                  Container(
                                                      width: (mySkills[index]
                                                                  .rating /
                                                              5) *
                                                          240,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(mySkills[index].type)
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ))
                    ]),
                  )),
              Container(
                height: 300.0,
                width: 400,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 15,
                      ),
                      child: Center(
                        child: Text('Education and Experience',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Center(
                      child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.graduationCap),
                        title: RichText(
                            text: TextSpan(
                                text: 'BTech Honors Software Engineering',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                      color: Colors.blue,
                                      fontSize: 16,
                                    ),
                                children: [
                              TextSpan(
                                  text: '@Harare Institute of Technology',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))
                            ])),
                        subtitle: Text('August 2017- August 2021'),
                      ),
                    ),
                    Center(
                      child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.code),
                        title: RichText(
                            text: TextSpan(
                                text: 'Web Developer',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                      color: Colors.blue,
                                      fontSize: 16,
                                    ),
                                children: [
                              TextSpan(
                                  text: '@Community Dental Partners',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))
                            ])),
                        subtitle: Text('April 2021 - Present'),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  color: Colors.white,
                  height: 150.0,
                  child: Center(child: Text("Comming Soon"))),
            ],
          ),
        ),
        // SliverList(
        //   delegate: SliverChildListDelegate(
        //     [
        //       Container(color: Colors.red, height: 150.0),
        //       Container(color: Colors.purple, height: 150.0),
        //       Container(color: Colors.green, height: 150.0),
        //     ],
        //   ),
        // )
      ],
    ));
  }
}
