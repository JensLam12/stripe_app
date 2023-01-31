part of 'helpers.dart';

showLoading( BuildContext context ) {
  showDialog(
    context: context,
    barrierDismissible: false, 
    builder: ( _ ) => const AlertDialog(
      title: Text('Wait...'),
      content: LinearProgressIndicator(),
    )
  );
}


showAlert( BuildContext context, String title, String message ) {
  showDialog(
    context: context, 
    builder: ( _ ) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        MaterialButton(
          child: const Text("OK"),
          onPressed: () => Navigator.of(context).pop()
        )
      ],
    )
  );
}