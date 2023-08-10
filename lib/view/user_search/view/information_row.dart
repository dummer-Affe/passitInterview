import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class InformationRow extends StatelessWidget {
  const InformationRow({super.key, required this.answer, required this.title});
  final String? title;
  final dynamic answer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kIsWeb ? 50.0 : 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
            // textAlign: TextAlign.left,
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Text(
              answer!.toString(),
              textAlign: TextAlign.end, overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.redAccent),
              // textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
