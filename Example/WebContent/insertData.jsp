<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Ayan Basuli</title>
</head>
<body>
		<%
        
        String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String user_name = request.getParameter("user_name");
        String password = request.getParameter("password");
		String address = request.getParameter("address");
		String contact_no = request.getParameter("contact_no");


		Connection con = null; 
		Statement stmt = null;  
		
        
        try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ayanbasuli", "ayanbasuli", "root");
			if (con != null) {
				
                stmt = con.createStatement();
				String rsql = "INSERT INTO employee (first_name, last_name, user_name, password, address, contact_no) VALUES " +
		                "('" + first_name + "','" + last_name + "','" + user_name + "','" + password + "','" + address + "','" + contact_no + "')";
				stmt.executeUpdate(rsql);
				
                out.println("Account Created");

			}
			if (con == null) {
				con.close(); 
			}
		}  
		    catch (SQLException se) {
			out.print("SQL:" + se.getMessage());
		}   catch (Exception e) {
			out.print("Exception:" + e.getMessage());
		}
		%>
		<a href="Retrieve.jsp">Show data</a>
    </body>
    </html>