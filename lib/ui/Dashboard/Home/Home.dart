import 'package:challenger_02_05_2021/data/repository.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final Artists artists;
  final Albums albums;
  const Home({
    Key key,
    this.artists,
    this.albums,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: size.width,
                  height: 191,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: artists.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 140,
                                width: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(artists[index].path),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                artists[index].name,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Recently played',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 1100,
                  width: size.width,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: albums.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 16, right: 16, bottom: 8),
                          child: Center(
                            child: Stack(
                              children: [
                                 Container(
                                    height: 350,
                                    width: size.width ,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(42),
                                        image: DecorationImage(
                                            image:
                                                AssetImage(albums[index].image),
                                            fit: BoxFit.cover)),
                                  ),
                               
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 30),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                              albums[index].imageartisc),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(albums[index].name,
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white,
                                            ))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
