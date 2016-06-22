package g

class Column {

	static hasMany = [tasks:Task]
	static belongsTo = [project:Project]
	String name;
	int    index;


	static constraints = {
        project nullable: false
		name blank: false
    }

	static mapping = {
        version false
        tasks cascade: 'all-delete-orphan'
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
