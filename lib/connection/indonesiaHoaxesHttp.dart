import 'package:pantaucovid19/connection/HttpConnection.dart';
import 'package:pantaucovid19/model/hoaxArticleModel.dart';
import 'package:pantaucovid19/res/environment.dart';

class IndonesiaHoaxesHttp extends HttpConnection {
  Future<List<ArticleItem>> getHoaxArticle({int page = 1}) async {
    var raw = await get(
      indonesiaHoaxesEndpoint + "wp-json/wp/v2/posts",
      params: {"search": "corona", "_fields": "id,guid,link,title,excerpt", "per_page": "15", "offset": (page * 15).toString()},
    );
    if (raw != null) {
      return raw.map((item) {
        return ArticleItem.fromJson(item);
      }).toList().cast<ArticleItem>();
    }
    return null;
  }

  Future<String> getArticle(String id) async {
    var raw = await get(indonesiaHoaxesEndpoint + "wp-json/wp/v2/posts/$id", params: {"_fields": "content"});
    if (raw != null) {
      return raw["content"]["rendered"];
    }
    return null;
  }
}
