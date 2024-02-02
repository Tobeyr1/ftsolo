import 'package:flutter/material.dart';
import 'package:ftsolo/extensions/locale.dart';

Future<bool> showPromptDialog({
  required BuildContext ctx,
  required String title,
  required String message,
  String okText = "Ok",
  String? cancelText = "Cancel",
}) async {
  return showDialog<bool>(
    context: ctx,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          if (cancelText != null)
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                cancelText == "Cancel" ? context.l10n.cancel : cancelText,
              ),
            ),
          FilledButton(
            child: Text(okText == "Ok" ? context.l10n.ok : okText),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
