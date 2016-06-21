package g

import java.text.SimpleDateFormat

class TaskController {

    def index() {
		render "${Task.findAll()*.name}"
	}

	def view() {
		[t:curTask()]
	}

	def edit() {
		[t:Task.findById(params.id)]
	}

	def _new() {
		def t = new Task()
		t.name = params['title']
		t.description = params['description']
		SimpleDateFormat df = new SimpleDateFormat('MM/dd/yyyy');
		t.deadline = df.parse(params['deadline']);
		t.column = Column.get(params['column_id'])
		if (!t.save()) {
			t.errors.each {
				render "${it}"
			}
		}
		render ""
	}

	def _save() {
		def t = Task.get(params['id'])
		t.name = params['title']
		t.description = params['description']
		SimpleDateFormat df = new SimpleDateFormat('MM/dd/yyyy');
		t.deadline = df.parse(params['deadline']);
		t.column = Column.get(params['column_id'])
		if (!t.save()) {
			t.errors.each {
				render "${it}"
			}
		}
		redirect(controller: 'project', action: 'view', params['project_id'])
	}

	def delete() {
		Task.get(params['id']).delete()
		render ""
	}

	private def curTask() {
		return Task.findById(params.id)
	}
}
