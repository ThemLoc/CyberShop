/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cybershop.interfacedao;

import java.util.List;

public interface InterfaceBasicDAO<T> {

    void create(T obj);

    void update(T obj);

    void delete(int id);

    List<T> getAll();

    T getById(int id);

}
