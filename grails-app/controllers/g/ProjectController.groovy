package g

class ProjectController {

	def index() {
		[projects:Project.findAll()]
	}

	def view() {
		[p:curProject()]
	}

	def create() {

	}

	def edit() {
		[p:curProject()]
	}

	def _new() {
		def p = new Project()
		p.name = params['name']
		p.status = params['status'].toUpperCase()
		p.save()
		redirect(action: '', controller: 'project', params: [:])
	}

	def _save() {
		def p = curProject()
		p.name = params['name']
		p.status = params["status"].toUpperCase()
		p.save()
		redirect(action: '', controller: 'project', params: [:])
	}

	def delete() {
		curProject().delete()
		redirect(action: '', controller: 'project', params: [:])
	}


	private def curProject() {
		return Project.get(params.id)
	}

}
