
import g.Project
import g.Task

import g.Column


class BootStrap {

    def init = { servletContext ->
		def p = new Project()
		p.setName("Evolution")
		p.save()

		def todo = new Column("todo", p).save()
		def doing = new Column("doing", p).save()
		def done = new Column("done", p).save()

		new Task("carnivorous", done).save()
		new Task("swimming", done).save()
		new Task("running", done).save()
		def t = new Task("render cards", doing)
		if( !t.save() ) {
			t.errors.each {
				println it
			}
		}

		p = new Project()
		p.setName("School of Drum")
		p.save()
    }
    def destroy = {
    }
}
