<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<% 

String user_name = request.getParameter("user_name");
String password = request.getParameter("password");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ayanbasuli", "ayanbasuli", "root");
	Statement statement = connection.createStatement();
	ResultSet set = statement.executeQuery("select * from employee");
	int flag = 0;
	while(set.next())
	{
		if(user_name.equals(set.getString(3)) && password.equals(set.getString(4)))
		{
			flag = 1;
		}
	}
	if(flag == 1)
	{
		response.sendRedirect("Welcome.jsp");
	}
	else
	{
		response.sendRedirect("Login.jsp");
	}
	response.sendRedirect("Login.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}



%>