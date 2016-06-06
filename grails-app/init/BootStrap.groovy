
import g.Project


class BootStrap {

    def init = { servletContext ->
		def p = new Project()
		p.setName("Evolution")
		p.setStatus("OPEN")
		p.save()
		p = new Project()
		p.setName("School of Drum")
		p.setStatus("CLOSED")
		p.save()
    }
    def destroy = {
    }
}
