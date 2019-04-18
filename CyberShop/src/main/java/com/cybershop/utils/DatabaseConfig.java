/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cybershop.utils;

import javax.sql.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
//import org.springframework.jdbc.datasource.SimpleDriverDataSource;

/**
 *
 * @author ngthe
 */
//@Configuration
public class DatabaseConfig {
    
     @Bean
    public DataSource getDataSource() {
//        DataSource ds = createDS();
        return null;
    }
//     private DataSource createDS() {
//        SimpleDriverDataSource ds = new SimpleDriverDataSource();
//        ds.setUrl("jdbc:jtds:sqlserver://localhost:1433/AssignemntNANO;");
//        ds.setUsername("sa");
//        ds.setPassword("abcdefj");
//        ds.setDriverClass(net.sourceforge.jtds.jdbc.Driver.class);
//        return ds;
//    }
    
}
