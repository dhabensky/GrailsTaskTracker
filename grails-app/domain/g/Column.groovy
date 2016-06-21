package g

class Column {

	static belongsTo = [project:Project]
	String name;
	int    index;


	static constraints = {
        project nullable: false
		name blank: false
    }
	
	def Column() {

	}

	def Column(String name) {
		this.name = name
	}

	def Column(String name, Project project) {
		this.name = name
		this.project = project
	}

}
