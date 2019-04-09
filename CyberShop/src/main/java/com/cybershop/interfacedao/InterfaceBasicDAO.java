/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cybershop.interfacedao;

import java.util.List;




/**
 *
 * @author ngthe
 */
public interface InterfaceBasicDAO<T> {
    void create(T object);
 
    void update(T t);
 
    void delete(T t);
    
    List<T> getAll();
    
    int count();
    
}
