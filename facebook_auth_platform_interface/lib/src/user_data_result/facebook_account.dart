part of user_data_result;

final class FacebookAccount implements FacebookUserDataResult {
  const FacebookAccount({
    this.id = '',
    this.email = '',
    this.name = '',
    this.picture,
  });

  /// The expected json structure is:
  /// ```json
  /// {
  ///     "email": "dsmr.apps@gmail.com",
  ///     "id": "3003332493073668",
  ///     "name": "Darwin Morocho",
  ///     "picture": {
  ///         "data": {
  ///             "height": 50,
  ///             "is_silhouette": 0,
  ///             "url": "https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=3003332493073668",
  ///             "width": 50,
  ///         },
  ///     }
  /// }
  /// ```
  factory FacebookAccount.fromJson(Map<String, dynamic> json) {
    final pictureData = json['picture']?['data'];
    return FacebookAccount(
      id: json['id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      picture: pictureData is! Map
          ? null
          : FacebookProfilePicture.fromJson(
              Map<String, dynamic>.from(pictureData),
            ),
    );
  }

  final String id;
  final String email;
  final String name;

  final FacebookProfilePicture? picture;
}

final class FacebookProfilePicture {
  const FacebookProfilePicture({
    required this.height,
    required this.width,
    required this.url,
  });

  factory FacebookProfilePicture.fromJson(Map<String, dynamic> json) {
    return FacebookProfilePicture(
      height: json['height'] as int,
      width: json['width'] as int,
      url: json['url'] as String,
    );
  }

  final int height;
  final int width;
  final String url;
}
