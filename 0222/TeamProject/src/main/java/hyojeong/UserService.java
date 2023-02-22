package hyojeong;

import java.util.List;

public class UserService {
		
	public boolean service(String action) {
		System.out.println("service 실행 확인하다");
		UserDAO dao = new UserDAO();
		boolean result = dao.login(action, action);
		
		return result;
	}
}
