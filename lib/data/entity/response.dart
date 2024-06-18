import 'gif_entity.dart';

class Response{
  final List<GifEntity> data;

  Response({
    required this.data,
});

  factory Response.fromJson(Map<String, dynamic> json){
    final gifs = json['data'] as List<dynamic>;
    final List<GifEntity> entities = [];
    
    for (final gif in gifs){
      entities.add(GifEntity.fromJson(gif as Map<String, dynamic>));
    }
    
    return Response(data: entities);
  }

}