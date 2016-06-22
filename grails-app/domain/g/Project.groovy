package g

class Project {

	String name;
	static hasMany = [columns:Column]

	static constraints = {
        name blank: false
    }

	static mapping = {
        version false
        columns cascade: 'all-delete-orphan'
    }

}
