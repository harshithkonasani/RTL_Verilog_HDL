module pin_to_pin_delay(
        input a_in,b_in,c_in,d_in,
        output y_out
        );  
 assign y_out = (a_in & b_in) | (c_in & d_in);
 
 specify
 specparam delay1 = 5;
 specparam delay2 = 6;
 
 if(a_in)
    (a_in => y_out) = delay1;
 if(!a_in)
    (a_in =>y_out) = delay2;
    
 endspecify
