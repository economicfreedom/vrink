package com.green.vrink.util;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;


public  class  Check {


    public static boolean isNull(Object object){
        if (object == null ){

            return true;
        }
        return false;
    }

}
