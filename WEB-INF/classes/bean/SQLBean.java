package bean;
import java.sql.*;


public class SQLBean{
	
    private Statement stmt=null;
	private Connection conn=null;
	ResultSet rs=null;
	public SQLBean(){}
	
	public void OpenConn()throws Exception{
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
              String url="jdbc:sqlserver://localhost:1433;DatabaseName=cars";
			  String user="sa";
			  String password="123456";
			  conn=DriverManager.getConnection(url,user,password);
			  }
			catch(SQLException e){
				System.err.println("Data.executeQuery:"+e.getMessage());
				}
			
		}
	public ResultSet executeQuery(String sql){
		rs=null;
		try{
			stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			rs=stmt.executeQuery(sql);
			}
			catch(SQLException e){
				System.err.println("Data.executeQuery:"+e.getMessage());
				}
				return rs;
	
		}
	public void executeUpdate(String sql){
		rs=null;
		stmt=null;
		try{
			stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			stmt.executeQuery(sql);
			stmt.close();
			conn.close();
			}
			catch(SQLException e){
				System.err.println("Data.executeQuery:"+e.getMessage());
				}
		}
	public void closeStmt(){
		try{
			stmt.close();
			}
			catch(SQLException e){
				System.err.println("Data.executeQuery:"+e.getMessage());
				}
		}	
	public void closeConn(){
		try{
			conn.close();
			}
			catch(SQLException e){
				System.err.println("Data.executeQuery:"+e.getMessage());
				}
		}

}