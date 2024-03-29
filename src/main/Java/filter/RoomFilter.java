package filter;

import model.Auth;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/admin/*")
public class RoomFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest)request).getSession();
        Auth auth = (Auth) session.getAttribute("auth");
        if(auth == null){
            ((HttpServletResponse)response).sendRedirect("/auth?message=You_need_Login");
            return;
        }
        if((!auth.getRole().getName().equalsIgnoreCase("ADMIN"))){
            ((HttpServletResponse)response).sendRedirect("/auth?message=You_need_Login");
            return;
        }
        chain.doFilter(request, response);
    }
}
