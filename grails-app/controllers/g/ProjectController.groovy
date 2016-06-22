package g


class ProjectController {

	def index() {
		[projects:Project.findAll()]
	}

	def view() {
		def p = curProject()
//		render "${Task.findAll()}"

        [p:p, taskMap:Column.findAllByProject(p).collect { [it, Task.findAllByColumnAndOpen(it, true)] }]
	}

	def create() {

	}

	def edit() {
		[p:curProject()]
	}

	def _new() {
		def p = new Project()
		p.name = params['name']
		p.save()
		new Column('Todo', p).save()
		new Column('Doing', p).save()
		new Column('Done', p).save()
		redirect(action: '', controller: 'project', params: [:])
	}

	def _save() {
		def p = curProject()
		p.name = params['name']
		p.save()
		redirect(action: '', controller: 'project', params: [:])
	}

	def delete() {
		def p = curProject()
//		p.columns*.delete()
		p.delete()
		redirect(action: '', controller: 'project', params: [:])
	}


	private def curProject() {
		return Project.get(params.id)
	}

}
