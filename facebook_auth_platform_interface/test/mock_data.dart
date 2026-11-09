// import 'package:dio/dio.dart';
import 'dart:convert';

abstract class MockData {
  static const accessToken = {
    "userId": "136742241592917",
    "token":
        "EAAS5elFDcaYBAB4KyXaxBtEBjkgYpAEZAZAFuV6VHxxfC29l6ZCjgEmYKVguY3Uos5fQ0blVON2WccIvLCQ72EFHDa0ZAmludHCbGN3jNDpzq2L78X74dYTYBAokZAzFWZBwg2biPlEboXkZCWjNWubmE3TES5er3yxZArstszCbQtfue1ECxkjzHhwUkdYNuMJgzo1WVUa4Cc7z2M029srT",
    "expires": 1610201170749,
    "lastRefresh": 1610051315980,
    "applicationId": "1329834907365798",
    "graphDomain": "facebook",
    "isExpired": false,
    "grantedPermissions": ["email", "user_link"],
    "declinedPermissions": [],
    "dataAccessExpirationTime": 1610201170749,
  };

  static const accessTokenWithAuthenticationToken = {
    "userId": "136742241592917",
    "token":
        "EAAS5elFDcaYBAB4KyXaxBtEBjkgYpAEZAZAFuV6VHxxfC29l6ZCjgEmYKVguY3Uos5fQ0blVON2WccIvLCQ72EFHDa0ZAmludHCbGN3jNDpzq2L78X74dYTYBAokZAzFWZBwg2biPlEboXkZCWjNWubmE3TES5er3yxZArstszCbQtfue1ECxkjzHhwUkdYNuMJgzo1WVUa4Cc7z2M029srT",
    "expires": 1610201170749,
    "lastRefresh": 1610051315980,
    "applicationId": "1329834907365798",
    "graphDomain": "facebook",
    "isExpired": false,
    "grantedPermissions": ["email", "openid", "user_link"],
    "declinedPermissions": [],
    "dataAccessExpirationTime": 1610201170749,
    "authenticationToken": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InRlc3Qta2V5In0.eyJpc3MiOiJodHRwczovL3d3dy5mYWNlYm9vay5jb20iLCJzdWIiOiIxMzY3NDIyNDE1OTI5MTciLCJhdWQiOiIxMzI5ODM0OTA3MzY1Nzk4IiwiaWF0IjoxNjEwMDUxMzE1LCJleHAiOjE2MTAyMDExNzAsIm5vbmNlIjoidGVzdC1ub25jZSJ9.signature",
  };

  static Map<String, dynamic> get userData {
    return {
      "name": "Open Graph Test User",
      "email": "open_jygexjs_user@tfbnw.net",
      "picture": {
        "data": {
          "height": 126,
          "is_silhouette": true,
          "url":
              "https://scontent.fuio21-1.fna.fbcdn.net/v/t1.30497-1/s200x200/84628273_176159830277856_972693363922829312_n.jpg?_nc_cat=1&ccb=2&_nc_sid=12b3be&_nc_ohc=3o6I0i4GDoIAX9NnWZh&_nc_ht=scontent.fuio21-1.fna&tp=7&oh=f4663dde69650ea86114d0839ee8748b&oe=601BA865",
          "width": 200
        }
      },
      "id": "136742241592917"
    };
  }

  /// The Graph API error the native SDKs report when there is no access token.
  static const graphApiError = {
    "code": 104,
    "error_subcode": -1,
    "message": "An access token is required to request this resource.",
  };

  /// What the native `getUserData` call answers: the user data when logged in (a JSON string on Android, a map on
  /// iOS), the Graph API error otherwise.
  static Map<String, dynamic> userDataResult({
    required bool isLogged,
    required bool isAndroid,
  }) {
    if (!isLogged) {
      return {"success": false, "error": graphApiError};
    }
    return {
      "success": true,
      "data": isAndroid ? jsonEncode(userData) : userData,
    };
  }
}
