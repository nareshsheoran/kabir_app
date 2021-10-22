import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kabir_app/Shared/constant.dart';
import 'package:kabir_app/Shared/routes.dart';
import 'package:kabir_app/api_details/predefined_num_api.dart';
import 'package:kabir_app/api_details/service/game_service.dart';
import 'package:kabir_app/api_details/service/predefined_service.dart';
import 'package:kabir_app/api_details/service/slider_service.dart';
import 'package:kabir_app/api_details/slide_details_api.dart';
import 'package:kabir_app/api_details/standard_game_api.dart';
import 'package:kabir_app/widget/home_page_widget.dart';
import 'package:kabir_app/viewmodel/home_page_viewmodel.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageInfoViewModel viewModel;

  List<Slides> slidesList = [];
  List<StandardGame>? standardGameList = [];
  List<Numbers> numbersList = [];

  void initState() {
    viewModel = HomePageInfoViewModel();
    init();
    super.initState();
  }

  Future init() async {
    standardGameList = await GameService.getInstance().fetchStandardGameName();
    setState(() {});

    slidesList = await SliderService.getInstance().fetchSliderData();
    setState(() {});

    numbersList =
        await PreDefinedService.getInstance().fetchPredefinedNumberData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<HomePageInfoViewModel>(
      model: viewModel,
      child: ScopedModelDescendant<HomePageInfoViewModel>(
          builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Constant.appBarColor,
            title: Text(
              'SKS MATKA',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.APP_WALLET);
                  },
                  child: Icon(Icons.wallet_giftcard))
            ],
          ),
          drawer: buildDrawer(context),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.whatshot,
                                size: 40,
                                color: Constant.primaryColor,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Icon(
                                Icons.message_outlined,
                                size: 40,
                                color: Constant.primaryColor,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Container(
                              height: 96,
                              width: MediaQuery.of(context).size.width / 1.5,
                              color: Colors.blueAccent,
                              child: CarouselSlider.builder(
                                options: CarouselOptions(
                                  aspectRatio: 2.0,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.vertical,
                                  autoPlay: true,
                                ),
                                itemCount: 2,
                                itemBuilder: (context, index, realIndex) =>
                                    ,
                              )),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, Routes.ADD_FUND);
                                },
                                child: Icon(
                                  Icons.account_balance_wallet_outlined,
                                  size: 40,
                                  color: Constant.primaryColor,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Icon(
                                Icons.star,
                                color: Constant.primaryColor,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Constant.primaryColor,
                          width: 6,
                        ),
                        left: BorderSide(
                          color: Constant.primaryColor,
                          width: 6,
                        ),
                        top: BorderSide(
                          color: Constant.primaryColor,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: Constant.primaryColor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.STAR_LINE_PAGE);
                        },
                        child: Row(
                          children: [
                            Text(
                              'Starline Game',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Constant.primaryColor),
                            ),
                            Expanded(child: Container()),
                            Container(
                                width: 40,
                                height: 40,
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                child: Icon(Icons.video_call_sharp))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Constant.primaryColor,
                          width: 6,
                        ),
                        left: BorderSide(
                          color: Constant.primaryColor,
                          width: 6,
                        ),
                        top: BorderSide(
                          color: Constant.primaryColor,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: Constant.primaryColor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.GALI_GAME_PAGE);
                        },
                        child: Row(
                          children: [
                            Text(
                              'Gali Desawar Game',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Constant.primaryColor),
                            ),
                            Expanded(child: Container()),
                            Container(
                                width: 40,
                                height: 40,
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                child: Icon(Icons.video_call_sharp))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  getHomePageInfoListWidget(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 64,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Naresh',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Constant.textColor),
                          ),
                          Text(
                            '9812677822',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Constant.textColor),
                          )
                        ],
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.star,
                        color: Constant.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Constant.primaryColor,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.APP_PROFILE_PAGE);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.contact_page,
                          color: Constant.textColor,
                        ),
                        title: Text(
                          'App Profile',
                          style: TextStyle(color: Constant.textColor),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.APP_WALLET);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Constant.textColor,
                        ),
                        title: Text(
                          'App Wallet',
                          style: TextStyle(color: Constant.textColor),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.GAME_HISTORY);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Constant.textColor,
                        ),
                        title: Text(
                          'Game History',
                          style: TextStyle(color: Constant.textColor),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.GAME_RATE);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.rate_review,
                          color: Constant.textColor,
                        ),
                        title: Text(
                          'Game Rate',
                          style: TextStyle(color: Constant.textColor),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.ADD_FUND);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Constant.textColor,
                        ),
                        title: Text(
                          'Add Fund',
                          style: TextStyle(color: Constant.textColor),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Constant.textColor,
                      ),
                      title: Text(
                        'Withdraw Fund',
                        style: TextStyle(color: Constant.textColor),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.APP_NOTIFICATION);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.notification_important,
                          color: Constant.textColor,
                        ),
                        title: Text(
                          'App Notification',
                          style: TextStyle(color: Constant.textColor),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.APP_NOTICEBOARD);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Constant.textColor,
                        ),
                        title: Text(
                          'App Noticeboard',
                          style: TextStyle(color: Constant.textColor),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.HOW_PLAY);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.ondemand_video,
                          color: Constant.textColor,
                        ),
                        title: Text(
                          'How To Play',
                          style: TextStyle(color: Constant.textColor),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Constant.textColor,
                      ),
                      title: Text(
                        'Share Now',
                        style: TextStyle(color: Constant.textColor),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Constant.textColor,
                      ),
                      title: Text(
                        'App LogOut',
                        style: TextStyle(color: Constant.textColor),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Constant.textColor,
                      ),
                      title: Text(
                        'version.1.3.3',
                        style: TextStyle(color: Constant.textColor),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getHomePageInfoListWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: viewModel.homeInfoModelList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, index) {
            return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.GAME_RUNNING);
                },
                child: HomePageWidget(viewModel.homeInfoModelList[index]));
          },
        ),
      ),
    );
  }
}
