<%@page import="java.sql.*" %>

<%!
public static final class Connect {
    
    private final String USERNAME = "root";
    private final String PASSWORD = "";
    private final String DATABASE = "hecipe";
    private final String HOST = "localhost:3306";
    private final String CONNECTION = String.format("jdbc:mysql://%s/%s", HOST, DATABASE);

    private Connection connection;
    private Statement statement;

    private Connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(CONNECTION, USERNAME, PASSWORD);
            statement = connection.createStatement();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    private static Connect instance;

    public static Connect getConnection(){
        if (instance == null){
            instance = new Connect();
        }
        return instance;
    }

    // dipake untuk nge select data
    public ResultSet executeQuery(String query){
        ResultSet resultSet = null;
        try {
            resultSet = statement.executeQuery(query);
        } catch(Exception e){
            e.printStackTrace();
        }
        return resultSet;
    }

    public Integer executeUpdate(String query){
        Integer result = 0;
        try {
            result = statement.executeUpdate(query);
        } catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }

}

%>