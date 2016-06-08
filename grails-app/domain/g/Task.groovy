package g

class Task {

	static belongsTo = [column:Column, assignee:User]

	static hasOne = [status:TaskStatus]

	String name;
	String description;
	Date   deadline;


	static constraints = {
        description nullable: true
        deadline nullable: true
        status nullable: true
        assignee nullable: true
    }


	def Task() {

	}

	def Task(String name) {
		this.name = name
	}

	def Task(String name, Column column) {
		this.name = name
		this.column = column
	}

}

