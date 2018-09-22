import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:scifiworld/services/movieService.dart';
import 'package:scifiworld/models/movie/scifiMovieResult.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'dart:async';

class ScifiMovieListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScifiMovieListPageState();
  }
}

class _ScifiMovieListPageState extends State<ScifiMovieListPage> {
  List<ScifiMovieResult> _scifiMovieList;
  ScrollController _scrollController = new ScrollController();
  final formatter = new DateFormat.yMMMMd("en_US");
  bool _isPerformingRequest = false;
  int page = 1;
  bool _endofMovies = false;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _getMoreData() async {
    if (!_isPerformingRequest) {
      setState(() => _isPerformingRequest = true);
      page += 1;
      List<ScifiMovieResult> newMovies =
          await MovieService.get().fetchScifiMovie(page);
      if (newMovies.isEmpty) {
        _endofMovies = true;
      }
      setState(() {
        _scifiMovieList.addAll(newMovies);
        _isPerformingRequest = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movies'),
          backgroundColor: Theme.of(context).primaryColorDark,
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Sort By',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            )
          ],
        ),
        body: _buildMoviesList(context));
  }

  Widget _buildMoviesList(BuildContext context) {
    if (_scifiMovieList == null) {
      MovieService.get().fetchScifiMovie(page).then((list) {
        setState(() {
          _scifiMovieList = list;
        });
      });
      return Center(
          child: Container(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 5.0),
              child: SizedBox(
                  width: 15.0,
                  height: 15.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)),
            ),
            Text(
              "Loading",
              style: TextStyle(color: Theme.of(context).primaryColor),
            )
          ],
        ),
      ));
    } else {
      return ListView.builder(
        itemCount: _scifiMovieList.length + 1,
        itemBuilder: (context, index) {
          if (_scifiMovieList.length == index && _endofMovies == false) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              // margin: EdgeInsets.only(left: 50.0, right: 50.0),
              child: Center(child: CircularProgressIndicator()),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    height: 150.0,
                    child: ListTile(
                      leading: Container(
                        child: CachedNetworkImage(
                          imageUrl: "https://image.tmdb.org/t/p/w500" +
                              _scifiMovieList[index].posterPath,
                          fit: BoxFit.cover,
                          width: 100.0,
                          height: 150.0,
                          placeholder: Image.asset(
                            "images/images.png",
                            width: 100.0,
                            height: 150.0,
                          ),
                        ),
                      ),
                      // title: Text(_scifiMovieList[index].title == null
                      //     ? "Title is Not Set"
                      //     : _scifiMovieList[index].title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(_scifiMovieList[index].title == null
                              ? "Title is Not Set"
                              : _scifiMovieList[index].title),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(_scifiMovieList[index].releaseDate == null
                              ? "Date is Not Set"
                              : '(' +
                                  _scifiMovieList[index]
                                      .releaseDate
                                      .substring(0, 4) +
                                  ')'),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.yellow.shade800,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                  _scifiMovieList[index].voteAverage.toString())
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.hd,
                                color: Colors.yellow.shade800,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(_scifiMovieList[index].popularity.toString())
                            ],
                          ),
                        ],
                      ),
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (_) {
                        //     return NewsDetailPage(newsId: _newsList[index].newsId, title: _newsList[index].title);
                        //   }));
                      },
                    )),
                Divider()
              ],
            );
          }
        },
        controller: _scrollController,
      );
    }
  }

  Future<Null> _backButtonClicked() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('Are you sure to exit the application?'),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text(
                'Okay',
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              onPressed: () {
                exit(0);
              },
            ),
            new FlatButton(
              child: new Text(
                'Cancel',
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
