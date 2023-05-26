import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl =
    "http://18.189.188.100:8000/trans/auth/v1/customer/send-money-m";

const String secretKey =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnd3RHVFkxMXR3Z1N6czJiYTFsektUSzFTRldTYk9pbiJ9.rH1Iv8E_XnMW9bme5_S17PF-mvqQYmWEGTzasXkLJug";
const String authToken =
    '\$2y\$10\$gTnw0.9jeUdKymlqaQsbFOZKgeTWTWSaWEbEHNOI-8byUQbOO1S9i';

Future sendMoney() async {
  List<PaymentOptionValues> p = [
    PaymentOptionValues(
        paymentLabel: "Enter Enrolment No",
        inputType: "text",
        labelValue: "Hugo"),
  ];

  var response = await http.post(
    Uri.parse(baseUrl),
    headers: {
      'Authorization': 'Bearer $secretKey',
      'auth_token': authToken,
      'platform': 'Android',
      'Content-Type': 'application/json'
    },
    body: jsonEncode({
      "amount": "1",
      "exchange_rate": "",
      "feed_coupon_code": "",
      "from_currency": "NGN",
      "send_type": "Instant",
      "apply_coupon": "No",
      "description": "",
      "phone_number": "2348123458282",
      "invoice_document": "",
      "to_currency": "NGN",
      "id": "682",
      "payment_option_values": [
        {
          "payment_label": "Enter Enrolment No",
          "input_type": "text",
          "label_value": "Hugo"
        },
        {
          "payment_label": "Enter Enrolment No",
          "input_type": "text",
          "label_value": "Hugo"
        },
        {
          "payment_label": "Enter Enrolment No",
          "input_type": "text",
          "label_value": "Hugo"
        }
      ]
    }),
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print(data);
    return data;
  } else {
    throw Exception(response.body);
  }
}

class PaymentOptionValues {
  PaymentOptionValues({
    required this.paymentLabel,
    required this.inputType,
    required this.labelValue,
  });

  final String paymentLabel;
  final String inputType;
  final String labelValue;

  factory PaymentOptionValues.fromRawJson(String str) =>
      PaymentOptionValues.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentOptionValues.fromJson(Map<String, dynamic> json) =>
      PaymentOptionValues(
        paymentLabel: json["payment_label"],
        inputType: json["input_type"],
        labelValue: json["label_value"],
      );

  Map<String, dynamic> toJson() => {
        "payment_label": paymentLabel,
        "input_type": inputType,
        "label_value": labelValue,
      };
}
