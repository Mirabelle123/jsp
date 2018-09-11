/** 
 * 自定义过滤器：用户拦截用户登录信息 
 *  
 * @author lizi 
 * @version 1.0.0 2015年7月14日19:29:45 
 */  
public class AutoLoginFilter implements Filter {  
      
  
    // 拦截所有用户请求。  
    // 首先判断session中是否存在用户名。  
    // 若session中不存在用户名，则判断Cookies中是否存在用户名  
    // 若Cookie中存在用户名，则将其放在session中。  
    public void doFilter(ServletRequest req, ServletResponse resp,  
            FilterChain chain) throws IOException, ServletException {  
  
        // 拦截用户请求  
        HttpServletRequest request = (HttpServletRequest) req;  
        // 判断session中，是否为空  
        // 若session中user为空，  
        if (request.getSession().getAttribute("user") == null) {  
            // 获取request中所有的Cookie，并放在数组中  
            Cookie[] cs = request.getCookies();  
            // 若Cookie不为空，则遍历所有的Cookie中所有的记录  
            if (cs != null && cs.length > 0) {  
                for (Cookie c : cs) {  
                    String cName = c.getName();  
                    // 查找当前用户的Cookie（此处为sso标识）  
                    if (cName.equals("sso")) {  
                        // 获取sso中对应的值，即：用户名userName  
                        String userName = c.getValue();  
                        // 把用户名userName放在session中  
                        request.getSession().setAttribute("user", userName);  
                    }  
                }  
            }  
        }  
        // 返回当前的请求  
        chain.doFilter(request, resp);  
    }  
  
      
  
} 