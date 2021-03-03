A Flutter app that consumes [Marvel Rest API](https://developer.marvel.com/)

# Main topics of this demo

- perform HTTP requests using [DIO](https://pub.dev/packages/dio)
- [get](https://pub.dev/packages/get) package for dependency management and route management
- state management with [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [testing](https://flutter.dev/docs/testing#integration-tests): unit test with flutter_test, and integration test with flutter_drive

# Installation

To run this example, you will need to create a `api_keys.json` placed in the `assets/keys` folder:

The content of this file looks like this:

```json
{
  "publicKey": "1234",
  "privateKey": "5678"
}
```

Where `public_key` and `private_key` are obtained from https://developer.marvel.com/account

## Getting Started

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
