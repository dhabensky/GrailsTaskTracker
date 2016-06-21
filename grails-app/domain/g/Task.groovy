package g

class Task {

	static belongsTo = [column:Column]

	String  name;
	String  description;
	Date    deadline;
	boolean open;


	static constraints = {
        description nullable: false
        deadline nullable: false
		name nullable: false
		column nullable: false
    }


	def Task() {
		this.open = true
		this.deadline = new Date()
		this.description = ''
	}

	def Task(String name) {
		this()
		this.name = name
	}

	def Task(String name, Column column) {
		this(name)
		this.column = column
	}

}

