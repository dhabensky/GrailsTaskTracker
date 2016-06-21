package g

class Project {

	String name;
	static hasMany = [columns:Column]

	static constraints = {
        name blank: false
    }

}
