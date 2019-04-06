/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cybershop.dtos;

import java.sql.Time;
import java.util.Date;

/**
 *
 * @author chungnguyen
 */
public class PromotionDTO {

    private int promoID;
    private String promoCode;
    private String discounType;
    private String discount;
    private String applyCondition;
    private Time startTime;
    private Time endTime;
    private int usedTurn;

    public PromotionDTO() {
    }

    public int getPromoID() {
        return promoID;
    }

    public void setPromoID(int promoID) {
        this.promoID = promoID;
    }

    public String getPromoCode() {
        return promoCode;
    }

    public void setPromoCode(String promoCode) {
        this.promoCode = promoCode;
    }

    public String getDiscounType() {
        return discounType;
    }

    public void setDiscounType(String discounType) {
        this.discounType = discounType;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public String getApplyCondition() {
        return applyCondition;
    }

    public void setApplyCondition(String applyCondition) {
        this.applyCondition = applyCondition;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }

    public int getUsedTurn() {
        return usedTurn;
    }

    public void setUsedTurn(int usedTurn) {
        this.usedTurn = usedTurn;
    }
    

}
