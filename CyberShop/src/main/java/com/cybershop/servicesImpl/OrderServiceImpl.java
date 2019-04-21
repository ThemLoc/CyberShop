/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cybershop.servicesImpl;

import com.cybershop.daos.OrderDAO;
import com.cybershop.models.Order;
import com.cybershop.services.OrderService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OrderServiceImpl implements OrderService{
    
    @Autowired
    private OrderDAO dao;
    
    @Autowired
    MailSender mailSender;

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void save(Order obj) {
        dao.create(obj);
    }

    @Transactional
    @Override
    public void remove(int id) {
        dao.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public Order findById(int id) {
        return dao.getById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Order> getByAll() {
        return dao.getAll();
    }
    
    @Async
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public void sendEmailOrder(String from, String to, String subject, String content){
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from);
        message.setTo(to);
        message.setSubject(subject);
        message.setText(content);
        mailSender.send(message);
    }
    
}
