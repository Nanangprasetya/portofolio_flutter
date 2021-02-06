import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:provider_http_req/Api/apiPost.dart';
import 'package:provider_http_req/Ui/uiPostDtl.dart';
import 'package:provider_http_req/Util/statusReq.dart';
import 'package:provider_http_req/Widget/alertDialog.dart';
import 'package:provider_http_req/Widget/bottomLoading.dart';

class UiPost extends StatefulWidget {
  @override
  _UiPostState createState() => _UiPostState();
}

class _UiPostState extends State<UiPost> {
  ScrollController _controller = ScrollController();
  double _scrollThreshold = 200.0;

  @override
  void initState() {
    super.initState();
    _pageScroll();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PostApi>(context, listen: false).firstPage();
    });
  }

  void error(BuildContext context, String e) async {
    showDialog<void>(
      context: context, barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text(e.toString())],
            ),
          ),
          actions: [
            FlatButton(
              child: Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _pageScroll() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.addListener(() {
        final maxScroll = _controller.position.maxScrollExtent;
        final currentScroll = _controller.position.pixels;
        if (maxScroll - currentScroll <= _scrollThreshold) {
          Provider.of<PostApi>(context, listen: false).nextPage();
        }
      });
    });
  }

  Future<void> _refreshData() async {
    return Provider.of<PostApi>(context, listen: false).refresPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Fetch"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            Provider.of<PostApi>(context, listen: false).firstPage();
          }),
      body: RefreshIndicator(
        onRefresh: () => _refreshData(),
        child: Center(
          child: Consumer<PostApi>(
            builder: (context, state, child) {
              print("Status Req => " + state.statusReq.toString());

              if (state.statusReq == StatusReq.loading) {
                return CircularProgressIndicator();
              }
              if (state.statusReq == StatusReq.emptyData) {
                return Text("Data is Empty");
              } else {
                if (state.statusReq == StatusReq.error) {
                  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                   return DialogUtil.showErrorDialog(context, state.errorReq);
                  });
                }
                return ListView.builder(
                  controller: _controller,
                  itemCount: state.listPost.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == state.listPost.length) {
                      return Visibility(
                        visible: state.statusReq == StatusReq.loadNextData,
                        child: BottomLoading(),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Text(state.listPost[index].id.toString()),
                        title: Text(state.listPost[index].title),
                        subtitle: Text(state.listPost[index].body),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UiPostDetail(id: state.listPost[index].id),
                              ));
                        },
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
