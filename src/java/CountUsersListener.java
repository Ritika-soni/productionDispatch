 import java.util.Date;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class CountUsersListener implements HttpSessionListener {
    
    //private final AtomicInteger activeSessionCount = new AtomicInteger();
    //private final AtomicInteger totalSessionCount = new AtomicInteger();
    private Set activeSessions = new HashSet<String>();
    private Set totalSessions = new HashSet<String>();
    private List empList = new LinkedList();

    @Override
    public void sessionCreated(HttpSessionEvent se) {
    /*    System.out.println("Session Creation called!!..");  
        activeSessionCount.incrementAndGet();        
        totalSessionCount.incrementAndGet();*/
        setSessionCount(se); 
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
      /*  System.out.println("Session Destruction called!!.."); 
        activeSessionCount.decrementAndGet();*/
        setSessionCount(se); 
    }
    
    private void setSessionCount(HttpSessionEvent se) {
        //se.getSession().getServletContext().setAttribute("currentusers", activeSessionCount.get());
        //se.getSession().getServletContext().setAttribute("totalusers", totalSessionCount.get());
        se.getSession().getServletContext().setAttribute("employeeData", empList);
        se.getSession().getServletContext().setAttribute("currentusers", activeSessions);
        se.getSession().getServletContext().setAttribute("totalusers", totalSessions);
      
    }
    
}
