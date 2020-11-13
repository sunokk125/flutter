import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_foreign/graphql/QueryMutation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DetailPlacePage extends StatefulWidget {
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<DetailPlacePage> {
  String _resId;
  TextEditingController commController = TextEditingController();

  VoidCallback refetchQuery;

  List<LazyCacheMap> rest;
  List<LazyCacheMap> comm;

  void dispose() {
    print("dispose() of LoginPage");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context).settings.arguments;

    _resId = args["res_idx"];

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(52, 73, 94, 1),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              })),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Query(
                options: QueryOptions(
                    documentNode: gql(QueryMutation.getRest(_resId))),
                builder: (QueryResult result,
                    {FetchMore fetchMore, VoidCallback refetch}) {
                  refetchQuery = refetch;
                  if (result.hasException) {
                    return Center(child: Text(result.exception.toString()));
                  }
                  if (result.loading) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    print(result.data['getRest']);
                    rest = (result.data['getRest'] as List<dynamic>)
                        .cast<LazyCacheMap>();
                    return placeWidget();
                  }
                }),
            inputComm(),
            commBox()
          ],
        ),
      ),
    );
  }

  Widget placeWidget() {
    dynamic resData = rest[0];
    var name = resData["res_name"];
    var address = resData["res_address"];
    var avgs = resData["avgs"];
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(avgs.toStringAsFixed(1))
            ],
          ),
        ),
        ListTile(
            leading: Icon(Icons.place),
            subtitle: Text(
              address,
              overflow: TextOverflow.clip,
            )),
      ],
    );
  }

  Widget inputComm() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: TextField(
        controller: commController,
        decoration: InputDecoration(
          hintText: "Send a message",
          suffixIcon: IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              print("Press sendButton");
            },
          ),
        ),
      ),
    );
  }

  Widget commBox() {
    return Expanded(
        child: Query(
      options: QueryOptions(
        documentNode: gql(QueryMutation.getRestsList()),
      ),
      builder: (QueryResult result,
          {FetchMore fetchMore, VoidCallback refetch}) {
        refetchQuery = refetch;
        if (result.hasException) {
          return Text(result.exception.toString());
        }
        if (result.loading) {
          return Text('Loading');
        }
        comm =
            (result.data['getRestsList'] as List<dynamic>).cast<LazyCacheMap>();

        return ListView.builder(
          itemCount: comm.length,
          itemBuilder: (context, index) {
            dynamic resData = comm[index];
            return ListTile(
              title: Text(resData['res_idx']),
            );
          },
        );
      },
    ));
  }
}
