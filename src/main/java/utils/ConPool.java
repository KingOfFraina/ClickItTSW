package utils;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.apache.tomcat.jdbc.pool.PoolProperties;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.TimeZone;

public class ConPool {
    private static DataSource datasource;

    public static Connection getConnection() throws SQLException {
        if (datasource == null) {
            PoolProperties p = new PoolProperties();
            p.setUrl("jdbc:mysql://188.166.107.139:3306/clickIt?serverTimezone=" + TimeZone.getDefault().getID());
            p.setDriverClassName("com.mysql.cj.jdbc.Driver");
            p.setUsername("utenteclick");
            p.setPassword("xMJt-5??>[tQ|3K");
            p.setMaxActive(1000);
            p.setInitialSize(10);
            p.setMinIdle(10);
            p.setRemoveAbandonedTimeout(60);
            p.setRemoveAbandoned(true);
            datasource = new DataSource();
            datasource.setPoolProperties(p);
        }
        return datasource.getConnection();
    }
}