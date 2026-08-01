import 'project_manager.dart';



class ProjectInitializer {



  Future<void> initialize(

    ProjectManager manager,

  ) async {



    await manager.load();





    if (!manager.hasProject) {



      manager.project.name =
          "Kraz";



      manager.project.description =
          "Personal AI Assistant";



      manager.project.platform =
          "Flutter Android";



      manager.project.status =
          "Genesis Development";



      manager.project.objective =
          "Membangun asisten pribadi digital "
          "yang memahami pengguna dan "
          "berkembang bersama pengguna.";



      await manager.save();


    }



  }



}