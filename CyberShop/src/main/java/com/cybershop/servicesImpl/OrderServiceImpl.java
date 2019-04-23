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
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDAO dao;

    @Autowired
    private JavaMailSender mailSender;

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

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public void sendEmailOrder(final String from, final String to, final String subject, final String content) {
//        MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");
//        message.setFrom(from);
//        message.setTo(to);
//        message.setSubject(subject);
//        message.setText(content);
//        mailSender.send(message);
        MimeMessagePreparator preparator = new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                message.setFrom(from);
                message.setTo(to);
                message.setSubject(subject);
                message.setText(content);
            }
        };
        mailSender.send(preparator);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Order> findByCusID(int id) {
        return dao.getByCusID(id);
    }

    @Transactional
    @Override
    public void updateStatus(String status, int id) {
        dao.updateStatus(status, id);
    }

}
