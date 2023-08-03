/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Sorting;

import BuyEntity.Feedback;
import java.util.Comparator;

/**
 *
 * @author user
 */
public class SortByDateFeedback implements Comparator<Feedback>{

    @Override
    public int compare(Feedback o1, Feedback o2) {
        return o1.getFeedbackDate().compareTo(o2.getFeedbackDate());
    }
    
}