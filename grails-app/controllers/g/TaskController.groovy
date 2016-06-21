package g

import java.text.SimpleDateFormat
import groovy.json.*

class TaskController {

    def index() {
		render "${Task.findAll()*.name}"
	}

	def view() {
		def t = curTask()
		render "{"
		render "name: ${t.name},"
		render "description: ${t.description},"
		SimpleDateFormat df = new SimpleDateFormat('MM/dd/yyyy');
		if (t.deadline)
			render "deadline: ${df.format(t.deadline)},"
		else
			render "deadline: null,"
		render "column_id: ${t.column.id},"
		render "open: ${t.open}"
		render "}"
	}

	def _close() {
		def t = curTask()
		t.open = false
		t.save()
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
		redirect(controller: 'project', action: 'view', params: [id: params['project_id']])
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
		redirect(controller: 'project', action: 'view', params: [id: params['project_id']])
	}

	def delete() {
		curTask().delete()
		render ""
	}

	private def curTask() {
		return Task.findById(params.id)
	}

}
