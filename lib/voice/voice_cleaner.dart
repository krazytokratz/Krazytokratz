class VoiceCleaner {


  static String clean(
    String text,
  ) {


    if (text.trim().isEmpty) {

      return "";

    }



    String cleaned = text;



    // ==============================
    // VOICE DICTIONARY
    // ==============================

    cleaned = cleaned.replaceAll(

      RegExp(
        r'\bKRAZ\b',
        caseSensitive: false,
      ),

      'Kraz',

    );



    cleaned = cleaned.replaceAll(

      RegExp(
        r'\bHR\b',
        caseSensitive: false,
      ),

      'Human Resources',

    );



    cleaned = cleaned.replaceAll(

      RegExp(
        r'\bAI\b',
        caseSensitive: false,
      ),

      'Artificial Intelligence',

    );



    // ==============================
    // REMOVE MARKDOWN SYMBOL
    // ==============================

    cleaned = cleaned.replaceAll(

      RegExp(
        r'[\=\_\-\#\*\`\~\>\<\|]',
      ),

      '',

    );



    // ==============================
    // REMOVE BRACKETS
    // ==============================

    cleaned = cleaned.replaceAll(

      RegExp(
        r'[\[\]\{\}\(\)]',
      ),

      '',

    );



    // ==============================
    // CLEAN COLON
    // ==============================

    cleaned = cleaned.replaceAll(

      ':',

      '.',

    );



    // ==============================
    // CLEAN MULTIPLE DOT
    // ==============================

    cleaned = cleaned.replaceAll(

      RegExp(
        r'\.{2,}',
      ),

      '.',

    );



    // ==============================
    // CLEAN NEW LINE
    // ==============================

    cleaned = cleaned.replaceAll(

      RegExp(
        r'\n+',
      ),

      '. ',

    );



    // ==============================
    // CLEAN SPACE
    // ==============================

    cleaned = cleaned.replaceAll(

      RegExp(
        r'\s+',
      ),

      ' ',

    );



    return cleaned.trim();


  }


}