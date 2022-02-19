import 'package:flutter/material.dart';
import 'package:places/screens/widgets/custom_divider.dart';
import 'package:places/service/api_client.dart';
import 'package:places/screens/widgets/slide_show.dart';
import 'package:places/screens/widgets/sliderInfinite.dart';
import 'package:intl/intl.dart';

import 'widgets/list_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final apiClient = ApiClient();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    apiClient.getPostApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final textThemeCustom = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        // title: Container(
        //   alignment: Alignment.center,
        //   height: 30,
        //   width: 100,
        //   child: Image.network(
        //     'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Coca-Cola_logo.svg/2560px-Coca-Cola_logo.svg.png',
        //     fit: BoxFit.fill,
        //   ),
        // ),
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [
          Row(
            children: [
              const Icon(Icons.pin_drop_rounded, color: Colors.white),
              Text(
                'Location',
                style: Theme.of(context).textTheme.headline2,
              ),
              const Icon(Icons.arrow_drop_down_outlined, color: Colors.white)
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // unselectedLabelStyle: TextStyle(color: Colors.cyan),
        // selectedLabelStyle:
        //     textThemeCustom.headline2!.copyWith(color: Colors.orange),
        //backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 20, color: Colors.white),
              activeIcon: Icon(Icons.home, size: 20, color: Colors.orange),
              label: 'Home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy, size: 20, color: Colors.white),
            activeIcon: Icon(Icons.file_copy, size: 20, color: Colors.orange),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 20, color: Colors.white),
            activeIcon: Icon(Icons.favorite, size: 20, color: Colors.orange),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, size: 20, color: Colors.white),
            activeIcon:
                Icon(Icons.notifications, size: 20, color: Colors.orange),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
                future: apiClient.getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return Stack(
                      children: [
                        SlideShow(
                          image1: apiClient.practice.backgroundImages![0].image,
                          image2: apiClient.practice.backgroundImages![1].image,
                          image3: apiClient.practice.backgroundImages![2].image,
                          heightScreen: screenHeight * .4,
                        ),
                        Positioned(
                          top: 100,
                          right: 45,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'What are you searching for?',
                                      style: textThemeCustom.headline1,
                                    )),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'FIND PROPERTY',
                                        style: textThemeCustom.headline2,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'POST A PROPERTY',
                                        style: textThemeCustom.headline2,
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        )
                      ],
                    );
                  }
                }),
            const CustomeDivider(),
            FutureBuilder(
                future: apiClient.getPostApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SliderInfinite(urlList: [
                        apiClient.practice.data![0].items![0].image ?? '',
                        apiClient.practice.data![0].items![1].image ?? '',
                        apiClient.practice.data![0].items![2].image ?? '',
                        apiClient.practice.data![0].items![3].image ?? '',
                        apiClient.practice.data![0].items![4].image ?? '',
                      ]),
                    );
                  } else {
                    return Container();
                  }
                }),
            const SizedBox(height: 5),
            const CustomeDivider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Top Picks',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'See all',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
            FutureBuilder(
                future: apiClient.getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  } else {
                    return Container(
                      height: 225,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: apiClient.practice.data![1].items!.length,
                          itemBuilder: (context, index) {
                            return ListCard(
                              imageUrl: apiClient
                                  .practice.data![1].items![index].thumbnail,
                              saleRentTag: apiClient.practice.data![1]
                                  .items![index].transact!.labelSeller
                                  .toString(),
                              titleCard: NumberFormat.compactCurrency(
                                name: 'name',
                                decimalDigits: 8,
                                symbol:
                                    '₹', // if you want to add currency symbol then pass that in this else leave it empty.
                              ).format(apiClient
                                  .practice.data![1].items![index].price),
                              descriptionCard: apiClient
                                  .practice.data![1].items![index].title,
                              descTag1: apiClient
                                  .practice.data![1].items![index].categorySlug
                                  .toString(),
                              descTag2: apiClient
                                  .practice.data![1].items![index].viewers
                                  .toString(),
                              locationCard: apiClient
                                  .practice.data![1].items![index].locality
                                  .toString(),
                            );
                          }),
                    );
                  }
                }),
            const SizedBox(height: 20),
            const CustomeDivider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Latest',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'See all',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
            FutureBuilder(
                future: apiClient.getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  } else {
                    return Container(
                      height: 225,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: apiClient.practice.data![1].items!.length,
                          itemBuilder: (context, index) {
                            return ListCard(
                              imageUrl: apiClient
                                  .practice.data![1].items![index].thumbnail,
                              saleRentTag: apiClient.practice.data![1]
                                  .items![index].transact!.labelSeller
                                  .toString(),
                              titleCard: NumberFormat.compactCurrency(
                                name: 'name',
                                decimalDigits: 8,
                                symbol:
                                    '₹', // if you want to add currency symbol then pass that in this else leave it empty.
                              ).format(apiClient
                                  .practice.data![1].items![index].price),
                              descriptionCard: apiClient
                                  .practice.data![1].items![index].title,
                              descTag1: apiClient
                                  .practice.data![1].items![index].categorySlug
                                  .toString(),
                              descTag2: apiClient
                                  .practice.data![1].items![index].viewers
                                  .toString(),
                              locationCard: apiClient
                                  .practice.data![1].items![index].locality
                                  .toString(),
                            );
                          }),
                    );
                  }
                }),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
