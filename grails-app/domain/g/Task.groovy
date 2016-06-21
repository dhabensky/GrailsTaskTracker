package g

class Task {

	static belongsTo = [column:Column]

	String  name;
	String  description;
	Date    deadline;
	boolean open;


	static constraints = {
        description nullable: true
        deadline nullable: true
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

