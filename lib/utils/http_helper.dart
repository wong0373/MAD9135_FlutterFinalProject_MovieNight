import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHelper {
  static String movieNightApiUrl = "https://movie-night-api.onrender.com";

  static startSession(String? deviceId) async {
    final response = await http.get(
      Uri.parse("$movieNightApiUrl/start-session?device_id=$deviceId"),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static joinSession(String code, String? deviceId) async {
    final response = await http.get(
      Uri.parse(
          "$movieNightApiUrl/join-session?code=$code&device_id=$deviceId"),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static voteMovie(String sessionId, String movieId, bool vote) async {
    final response = await http.get(
      Uri.parse(
          "$movieNightApiUrl/vote-movie?session_id=$sessionId&movie_id=$movieId&vote=$vote"),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static getPopularMovies(int page) async {
    final response = await http.get(
      Uri.parse(
          "https://api.themoviedb.org/3/movie/popular?language=en-US&page=$page"),
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MDk2OTUxMWU5ZGM5Zjk2OWEyMDZjOTQ5MzA5N2YyNCIsIm5iZiI6MTY5OTg4ODIxOC4yMTQwMDAyLCJzdWIiOiI2NTUyM2M1YTA4MTZjNzAwYzNkOWU4MmQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.GE83gUduuqIbCOXo_y-8qr2KEGwQcDHchS8o21ENCUg",
        "accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.body);
    }
  }
}
