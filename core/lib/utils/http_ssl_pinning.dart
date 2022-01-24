import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class SSLPinning {
  static Future<http.Client> get _instance async =>
      _clientInstance ??= await createLEClient();

  static http.Client? _clientInstance;

  static http.Client get client => _clientInstance ?? http.Client();

  static Future<void> init() async {
    _clientInstance = await _instance;
  }

  static Future<HttpClient> customHttpClient({
    bool isTestMode = false,
  }) async {
    SecurityContext context = SecurityContext(withTrustedRoots: false);
    try {
      List<int> bytes = [];

      if (isTestMode) {
        bytes = utf8.encode(_certificate);
      } else {
        bytes = (await rootBundle.load('assets/certificates/certificates.cer'))
            .buffer
            .asUint8List();
      }
      context.setTrustedCertificatesBytes(bytes);
    } on TlsException catch (e) {
      if (e.osError?.message != null &&
          e.osError!.message.contains('CERT_ALREADY_IN_HASH_TABLE')) {
        log('createHttpClient() - cert already trusted! Skipping.');
      } else {
        log('createHttpClient().setTrustedCertificateBytes EXCEPTION: $e');
        rethrow;
      }
    } catch (e) {
      log('unexpected error $e');
      rethrow;
    }
    HttpClient httpClient = HttpClient(context: context);
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;

    return httpClient;
  }

  static Future<http.Client> createLEClient({bool isTestMode = false}) async {
    IOClient client = IOClient(await customHttpClient(isTestMode: isTestMode));
    return client;
  }
}

const _certificate = """
-----BEGIN CERTIFICATE-----
MIIFOjCCBCKgAwIBAgISBIiVuxnp8VVhFS2eIEUrsVCEMA0GCSqGSIb3DQEBCwUA
MDIxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1MZXQncyBFbmNyeXB0MQswCQYDVQQD
EwJSMzAeFw0yMjAxMTQxODE4MjJaFw0yMjA0MTQxODE4MjFaMCQxIjAgBgNVBAMT
GWRldmVsb3BlcnMudGhlbW92aWVkYi5vcmcwggEiMA0GCSqGSIb3DQEBAQUAA4IB
DwAwggEKAoIBAQDDvYImh4iOQsIbEafPSdZ2G4Wj7ltL9bp8WFw1C6ItnX33CX8t
qsXoyINLx2hfpQcaja/k4EMz7nXtomNWltBx/lhlde7lmjg3VU90p3eQV4UasOPf
SKHPuIKeLV0ux5b3ULcM1bUlBhM2oDkp/yWhLSWbnS+onXWQp5pUfHMGz7fCKvRr
WiKC7cpF0OeFKqUx4snyyQJMqeox1IOj74AUv1wKCzAUvc1opvxha34StmXdojFb
mPJi6OuVmekr3EMOT/WO3xiUiGuPNZzaQzD3jbw6vpTl0cxZ3jnmiiw4zqpJMwMj
jehnI8HbyzvPSw1ynkA4Ms/n6DekJkOsi/lnAgMBAAGjggJWMIICUjAOBgNVHQ8B
Af8EBAMCBaAwHQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMCMAwGA1UdEwEB
/wQCMAAwHQYDVR0OBBYEFMmJmOK2JBzTXDIXZrLBC881wOhiMB8GA1UdIwQYMBaA
FBQusxe3WFbLrlAJQOYfr52LFMLGMFUGCCsGAQUFBwEBBEkwRzAhBggrBgEFBQcw
AYYVaHR0cDovL3IzLm8ubGVuY3Iub3JnMCIGCCsGAQUFBzAChhZodHRwOi8vcjMu
aS5sZW5jci5vcmcvMCQGA1UdEQQdMBuCGWRldmVsb3BlcnMudGhlbW92aWVkYi5v
cmcwTAYDVR0gBEUwQzAIBgZngQwBAgEwNwYLKwYBBAGC3xMBAQEwKDAmBggrBgEF
BQcCARYaaHR0cDovL2Nwcy5sZXRzZW5jcnlwdC5vcmcwggEGBgorBgEEAdZ5AgQC
BIH3BIH0APIAdwDfpV6raIJPH2yt7rhfTj5a6s2iEqRqXo47EsAgRFwqcwAAAX5a
Bs/bAAAEAwBIMEYCIQCiA2SVmDLv4muV2Q5hyK2Z9alxwCFU7Ih0OeUnNFSnuQIh
ANyJ9t3DFLYHyQevg1n7sms9Pau3cw5/2i2a3hJg7nxSAHcARqVV63X6kSAwtaKJ
afTzfREsQXS+/Um4havy/HD+bUcAAAF+WgbP/gAABAMASDBGAiEA8XZR8CvJrXBf
y0LmeTspmdyEkzP/05ak2fCfvfXytJACIQD1I+O/3lqa34L4f2tmmltjPDeu7LNb
3fMnthrAOUNb0DANBgkqhkiG9w0BAQsFAAOCAQEAirnDhH0WNpZ1cNsnbZeig8Er
DGdTUAJyINmNxrIOsWzDB4HKdUjW6MgrkHUJgivi2NRCq5t8wlV2J856rptTVoK5
1dSMcHRy6GAsw8vG603KIJY/rCNwEbTCinfdrKNLIizIop6atXYolHzRhWv5Ym0O
kI7UrEc3OmhHoubSxWgFtYOMc4nJvi1whxDot3jGkjx6FofX+GqnnYuYbTKV4AxP
4nsujTM3fizcLeJtcaydl4HvsFEbfZWi+8Shhk+EDgzLYJ9KTuooKV8yEUVvBSyA
TCBGPnHMkUiq/h+XZsbCFTR+hBa/LDS9ZD3drIqa2u6EAalRXriSXdDVck664A==
-----END CERTIFICATE-----
""";
