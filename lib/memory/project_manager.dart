import 'project_memory.dart';
import 'project_storage.dart';



class ProjectManager {



  final ProjectStorage storage =
      ProjectStorage();




  ProjectMemory project =
      ProjectMemory();






  Future<void> load() async {


    project =
        await storage.loadProject();


  }







  Future<void> save() async {


    await storage.saveProject(

      project,

    );


  }







  bool get hasProject {


    return

        project.name != null &&

        project.name!.isNotEmpty;


  }







  String summary() {


    return project.summary();


  }






}