package ${package}

import javax.servlet._
import javax.servlet.http._

class CreateIndexServlet extends HttpServlet {
  override def doGet(req: HttpServletRequest, resp: HttpServletResponse) {
    resp.getWriter().print("Hello, world!")
  }
}
