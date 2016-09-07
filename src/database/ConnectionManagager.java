package database;

import java.beans.PropertyVetoException;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class ConnectionManagager {
	private static ComboPooledDataSource cpds;
	private static boolean isInitilized = false;

	public static Connection getConnection() throws IOException, SQLException, PropertyVetoException {
		if (!isInitilized) {
			initilize();
			isInitilized = true;
		}

		return cpds.getConnection();
	}

	private static void initilize() throws IOException, SQLException, PropertyVetoException {
		cpds = new ComboPooledDataSource();

		configDB();

		cpds.setInitialPoolSize(10);
		cpds.setMinPoolSize(10);
		cpds.setAcquireIncrement(2);
		cpds.setMaxPoolSize(20);
		cpds.setMaxStatements(180);
	}

	private static void configDB() throws FileNotFoundException, IOException, PropertyVetoException {
		cpds.setDriverClass("com.mysql.jdbc.Driver");
		cpds.setJdbcUrl("jdbc:mysql://localhost:8080/kms");
		cpds.setUser("root");
		cpds.setPassword("#4271011304@");
		// cpds.setJdbcUrl("jdbc:mysql://localhost:3306/kms");
		// cpds.setUser("root");
		// cpds.setPassword("sanay.rosh");
		// cpds.setDriverClass("com.mysql.jdbc.Driver"); //loads the jdbc driver
		// Properties DBConfig = new Properties();
		// final File dbConfigFile = new File("DBConfig.properties");
		// System.out.println(dbConfigFile.getAbsolutePath());
		// DBConfig.load(new FileInputStream(dbConfigFile ));
		// String url = DBConfig.getProperty("url");
		// String username = DBConfig.getProperty("username");
		// String password = DBConfig.getProperty("password");
		// if(url == null || password == null || username == null){
		// cpds.setJdbcUrl("jdbc:mysql://localhost:3306/kms");
		// cpds.setUser("root");
		// cpds.setPassword("35462832");
		// else{
		// System.out.println("Entered");
		// cpds.setJdbcUrl(url);
		// cpds.setUser(username);
		// cpds.setPassword(password);
		// }
	}

	public static void close() {
		cpds.close();
	}

}
