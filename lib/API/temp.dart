

// var get_cards =
//         await dio.get("https://trello.backend.tests.nekidaem.ru/api/v1/cards/",
//             options: Options(headers: {
//               "Authorization": "token: ${token}",
//               'Accept': 'application/json',
//               "Content-Type": "application/json"
//             }));

//     var update = await Dio().patch(
//         "https://trello.backend.tests.nekidaem.ru/api/v1/cards/{id}/",
//         options: Options(headers: {
//           "Authorization": "token: ${token}",
//           "Content-Type": "application/json"
//         }));

//     var json = jsonDecode(get_cards.data)(update.data);
//     var value = json["id"]["row"]["seq_num"]["text"];
//     print(get_cards);
//     print(value);
//   } catch (e) {
//     print(e);
//   }