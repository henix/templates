package ${package}

import javax.servlet._
import javax.servlet.http._

class Servlet extends HttpServlet {
  override def doGet(req: HttpServletRequest, resp: HttpServletResponse) {
    resp.getWriter().print("Hello, world!")
  }
}
