class HandlerRouter {

  final List<dynamic> handlers;

  HandlerRouter({

    required this.handlers,

  });

  Future<String?> handle(

    String message,

  ) async {

    for (

      final handler in handlers

    ) {

      final result =

          await handler.handle(

        message,

      );

      if (

        result != null &&

        result.trim().isNotEmpty

      ) {

        return result;

      }

    }

    return null;

  }

}