class ProjectMemory {


  String? name;

  String? description;

  String? platform;

  String? status;

  String? objective;



  ProjectMemory({

    this.name,

    this.description,

    this.platform,

    this.status,

    this.objective,

  });





  String summary() {


    return """

===== PROJECT MEMORY =====

Nama:
${name ?? "-"}

Deskripsi:
${description ?? "-"}

Platform:
${platform ?? "-"}

Status:
${status ?? "-"}

Tujuan:
${objective ?? "-"}

==========================

""";


  }



}