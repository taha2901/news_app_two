import 'package:equatable/equatable.dart';

import 'source.dart';

class Article extends Equatable {
	final Source? source;
	final String? author;
	final String? title;
	final dynamic description;
	final String? url;
	final dynamic urlToImage;
	final String? publishedAt;
	final dynamic content;

	const Article({
		this.source, 
		this.author, 
		this.title, 
		this.description, 
		this.url, 
		this.urlToImage, 
		this.publishedAt, 
		this.content, 
	});

	factory Article.fromJson(Map<String, dynamic> json) => Article(
				source: json['source'] == null
						? null
						: Source.fromJson(json['source'] as Map<String, dynamic>),
				author: json['author'] as String?,
				title: json['title'] as String?,
				description: json['description'] as dynamic,
				url: json['url'] as String?,
				urlToImage: json['urlToImage'] as dynamic,
				publishedAt: json['publishedAt'] as String?,
				content: json['content'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'source': source?.toJson(),
				'author': author,
				'title': title,
				'description': description,
				'url': url,
				'urlToImage': urlToImage,
				'publishedAt': publishedAt,
				'content': content,
			};

	@override
	List<Object?> get props {
		return [
				source,
				author,
				title,
				description,
				url,
				urlToImage,
				publishedAt,
				content,
		];
	}
}
