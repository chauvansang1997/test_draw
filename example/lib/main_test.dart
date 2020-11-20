// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// void main() {
//   runApp(MaterialApp(
//     title: 'Confetti',
//     home: Scaffold(
//       body: Center(
//         child: RaisedButton(
//           onPressed: _launchURL,
//           child: Text('Show Flutter homepage'),
//         ),
//       ),
//     ),
//   ));
// }
//
//
// _                                                                                                                                                 URL() async {
//   // Sec-Fetch-Site: none
//   // Sec-Fetch-Mode: navigate
//   // Sec-Fetch-User: ?1
//   // Sec-Fetch-Dest: document
//
//   const url = 'http://graph.facebook.com/100010696063840/picture?width=91&access_token=EAAEppgm4jTEBAOmVjQAb0sgn7UnSCvZBHMPd6hc3wUT9Wc7FelwOAtZAcaHZCUAoBgVR9LaPYdjrhdajXvwe5mN2MKUL8civX5olTvPs6tR0tQPnpz5UeNH7brnvG6QpU2aNTCjqMmjnGtjfOFDMdsYslBTd1vyHktRI39oGdhZCPXi2Y8AD3jxnd1k977cZD';
//   final client = http.Client();
//   final request =  http.Request('GET', Uri.parse(url))
//     ..followRedirects = false..headers.addAll(<String,String>{'Sec-Fetch-Mode':'navigate', 'Sec-Fetch-Site':'none', 'Sec-Fetch-User':'?1',
//     'Sec-Fetch-Dest':'document'
//     });
//   final response = await client.send(request);
//
//   print(response.headers['location']);
//   print(response.statusCode);
// }
