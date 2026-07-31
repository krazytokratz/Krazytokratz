class VoiceCleaner {



  static String clean(
    String text,
  ) {


    return text

        .replaceAll(
          RegExp(r'[=\-_#*]'),
          '',
        )

        .replaceAll(
          ':',
          '',
        )

        .replaceAll(
          '\n\n',
          '. ',
        )

        .trim();


  }



}