package g

import java.text.SimpleDateFormat

class TaskController {

    def index() { }

	def view() {
		[t:curTask()]
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
		t.name = params['title']
		t.description = params['description']
		SimpleDateFormat df = new SimpleDateFormat('MM/dd/yyyy');
		t.deadline = df.parse(params['deadline']);
		t.column = Column.get(params['column_id'])
		t.save()
		render ""
	}

	def delete() {
		Task.findById(params.id).delete()
		redirect(action: '', controller: 'project', params: [:])
	}

	private def curTask() {
		return Task.findById(params.id)
	}
}
