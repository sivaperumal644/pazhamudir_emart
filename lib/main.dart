import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pazhamuthir_emart/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'appState.dart';
import 'screens/auth_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isAuthenticated = false;

  @override
  void initState() {
    // TODO: implement initState
    _getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink =
        HttpLink(uri: 'https://pazhamudhir.herokuapp.com/');

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: httpLink as Link,
      ),
    );

    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: ChangeNotifierProvider<AppState>(
          builder: (_) => AppState(),
          child: MaterialApp(
            home: isAuthenticated ? HomeScreen() : AuthScreen(),
            theme: ThemeData(canvasColor: Colors.transparent),
          ),
        ),
      ),
    );
  }

  _getPref() async {
    //final appState = Provider.of<AppState>(context);
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    setState(() {
      isAuthenticated = token != null;
    });
  }
}
