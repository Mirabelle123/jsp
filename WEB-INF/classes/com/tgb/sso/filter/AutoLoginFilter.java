/** 
 * �Զ�����������û������û���¼��Ϣ 
 *  
 * @author lizi 
 * @version 1.0.0 2015��7��14��19:29:45 
 */  
public class AutoLoginFilter implements Filter {  
      
  
    // ���������û�����  
    // �����ж�session���Ƿ�����û�����  
    // ��session�в������û��������ж�Cookies���Ƿ�����û���  
    // ��Cookie�д����û������������session�С�  
    public void doFilter(ServletRequest req, ServletResponse resp,  
            FilterChain chain) throws IOException, ServletException {  
  
        // �����û�����  
        HttpServletRequest request = (HttpServletRequest) req;  
        // �ж�session�У��Ƿ�Ϊ��  
        // ��session��userΪ�գ�  
        if (request.getSession().getAttribute("user") == null) {  
            // ��ȡrequest�����е�Cookie��������������  
            Cookie[] cs = request.getCookies();  
            // ��Cookie��Ϊ�գ���������е�Cookie�����еļ�¼  
            if (cs != null && cs.length > 0) {  
                for (Cookie c : cs) {  
                    String cName = c.getName();  
                    // ���ҵ�ǰ�û���Cookie���˴�Ϊsso��ʶ��  
                    if (cName.equals("sso")) {  
                        // ��ȡsso�ж�Ӧ��ֵ�������û���userName  
                        String userName = c.getValue();  
                        // ���û���userName����session��  
                        request.getSession().setAttribute("user", userName);  
                    }  
                }  
            }  
        }  
        // ���ص�ǰ������  
        chain.doFilter(request, resp);  
    }  
  
      
  
} 