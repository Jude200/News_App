const String api_key = "51efbe272f4a495bb21f8e10b8e04a45";
const String urlApi_Key = "&apiKey=$api_key";
const String baseUrl = 'https://newsapi.org/v2';
const String urlLang = "?country=fr";
const String urlTopHeadLines = '/top-headlines';
const String urlEverything = '/everything';

String makeSearchUrl(String keyWord) {
  return '$baseUrl/everything?q=$keyWord$urlApi_Key';
}

String makeCategoryUrl(String category) {
  return '$baseUrl/everything&category=$category$urlApi_Key';
}
