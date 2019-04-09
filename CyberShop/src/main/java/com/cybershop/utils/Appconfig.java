/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cybershop.utils;

import com.cybershop.daos.AdminDAO;
import com.cybershop.daos.BannerDAO;
import com.cybershop.daos.CategoryDAO;
import com.cybershop.daos.CustomerDAO;
import com.cybershop.daos.ImageDAO;
import com.cybershop.daos.OrderDAO;
import com.cybershop.daos.OrderDetailDAO;
import com.cybershop.daos.ProductDAO;
import com.cybershop.daos.PromotionDAO;
import com.cybershop.daos.StoreInformationDAO;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

/**
 *
 * @author ngthe
 */
@Configuration
@Import(DatabaseConfig.class)
public class Appconfig {
    @Autowired
    DataSource dataSource;
    @Bean(name="jdbcCustomer")
    public CustomerDAO jdbcCustomer(){
        CustomerDAO dao = new CustomerDAO();
        dao.setDataSource(dataSource);
        return dao;
    }
    @Bean(name="jdbcAdmin")
    public AdminDAO jdbcAdmin(){
        AdminDAO dao = new AdminDAO();
        dao.setDataSource(dataSource);
        return dao;
    }
    @Bean(name="jdbcBanner")
    public BannerDAO jdbcBanner(){
        BannerDAO dao = new BannerDAO();
        dao.setDataSource(dataSource);
        return dao;
    }
    @Bean(name="jdbcCatgory")
    public CategoryDAO jdbcCategory(){
        CategoryDAO dao = new CategoryDAO();
        dao.setDataSource(dataSource);
        return dao;
    }
    @Bean(name="jdbcImage")
    public ImageDAO jdbcImage(){
        ImageDAO dao = new ImageDAO();
        dao.setDataSource(dataSource);
        return dao;
    }
    @Bean(name="jdbcOrder")
    public OrderDAO jdbcOrder(){
        OrderDAO dao = new OrderDAO();
        dao.setDataSource(dataSource);
        return dao;
    }
    @Bean(name="jdbcOrderDetail")
    public OrderDetailDAO jdbcOrderDetail(){
        OrderDetailDAO dao = new OrderDetailDAO();
        dao.setDataSource(dataSource);
        return dao;
    }
    @Bean(name="jdbcProduct")
    public ProductDAO jdbcProduct(){
        ProductDAO dao = new ProductDAO();
        dao.setDataSource(dataSource);
        return dao;
    }
    @Bean(name="jdbcPromotion")
    public PromotionDAO jdbcPromotion(){
        PromotionDAO dao = new PromotionDAO();
        dao.setDataSource(dataSource);
        return dao;
    }
    @Bean(name="jdbcStore")
    public StoreInformationDAO jdbcStore(){
        StoreInformationDAO dao = new StoreInformationDAO();
        dao.setDataSource(dataSource);
        return dao;
    }
}
