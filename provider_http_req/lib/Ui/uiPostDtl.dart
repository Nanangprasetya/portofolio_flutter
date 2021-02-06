import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:provider_http_req/Api/apiPost.dart';
import 'package:provider_http_req/Util/statusReq.dart';
import 'package:provider_http_req/Widget/alertDialog.dart';

class UiPostDetail extends StatelessWidget {
  final int id;

  const UiPostDetail({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Post"),
      ),
      body: FutureBuilder(
          future: Provider.of<PostApi>(context, listen: false).getPostById(id),
          builder: (context, snapshot) {
            return Consumer<PostApi>(
              builder: (context, state, child) {
                if (state.statusReq == StatusReq.loading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state.statusReq == StatusReq.emptyData) {
                  return Center(child: Text("Data is Empty"));
                } else {
                  if (state.statusReq == StatusReq.error) {
                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                      DialogUtil.showErrorDialog(context, state.errorReq);
                    });
                  }
                  return _bodyData(state);
                }
              },
            );
          }),
    );
  }

  Widget _bodyData(PostApi state) {
    if (state.statusReq == StatusReq.hasData) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                state.postById.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                state.postById.body,
              ),
            ],
          ),
        ),
      );
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
