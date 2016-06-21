package g

class TaskController {

    def index() { }

	def view() {
		[t:curTask()]
	}

	def create() {
		[t:new Task()]
	}

	def edit() {
		[t:Task.findById(params.id)]
	}

	def _new() {
		def t = new Task()
		t.name = params['name']
		t.save()
		redirect(action: '', controller: 'project', params: [:])
	}

	def _save() {
		def t = new Task()
		t.title = params['title']
		t.description = params['description']
		t.name = params['name']
		t.save()
		redirect(action: '', controller: 'project', params: [:])
	}

	def delete() {
		Task.findById(params.id).delete()
		redirect(action: '', controller: 'project', params: [:])
	}

	private def curTask() {
		return Task.findById(params.id)
	}
}
