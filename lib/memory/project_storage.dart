import 'package:shared_preferences/shared_preferences.dart';

import 'project_memory.dart';



class ProjectStorage {



  static const String projectKey =
      "kraz_project_memory";





  // ==========================
  // SAVE PROJECT
  // ==========================


  Future<void> saveProject(

    ProjectMemory project,

  ) async {


    final prefs =
        await SharedPreferences.getInstance();



    await prefs.setString(

      projectKey,

      _toJson(project),

    );


  }







  // ==========================
  // LOAD PROJECT
  // ==========================


  Future<ProjectMemory> loadProject() async {


    final prefs =
        await SharedPreferences.getInstance();



    final data =
        prefs.getString(

          projectKey,

        );



    if(data == null) {


      return ProjectMemory();


    }





    return _fromJson(data);


  }







  // ==========================
  // CONVERT JSON
  // ==========================


  String _toJson(

    ProjectMemory project,

  ) {


    return '''

{

"name":"${project.name ?? ""}",

"description":"${project.description ?? ""}",

"platform":"${project.platform ?? ""}",

"status":"${project.status ?? ""}",

"objective":"${project.objective ?? ""}"

}

''';


  }







  ProjectMemory _fromJson(

    String data,

  ) {


    return ProjectMemory(

      name: _extract(data, "name"),

      description: _extract(data, "description"),

      platform: _extract(data, "platform"),

      status: _extract(data, "status"),

      objective: _extract(data, "objective"),

    );


  }







  String? _extract(

    String data,

    String key,

  ) {


    final start =

        data.indexOf(

          '"$key":"',

        );



    if(start == -1) {


      return null;


    }



    final begin =

        start +

        key.length +

        4;



    final end =

        data.indexOf(

          '"',

          begin,

        );



    if(end == -1) {


      return null;


    }



    return data.substring(

      begin,

      end,

    );


  }



}