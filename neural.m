m=1;
n=2;
i1=0.05;
i2=0.1;
o1=0.0100;
o2=0.9900;
lr = 0.6;
%w = 0 + (1).*rand(number_of_weights,1)
w(1)=0.13;
w(2)=0.2;
w(3)=0.25;
w(4)=0.3;
w(5)=0.4;
w(6)=0.45;
w(7)=0.5;
w(8)=0.55;

input_units=2;
hidden_units=2;
output_units=2;
bias_units=hidden_units+output_units;
for a=1:bias_units
    bias_units(a)=0;
end
number_of_weights=(input_units*hidden_units)+(hidden_units*output_units);

for b=1:hidden_units
    net_h(b)=(i1*(w(m)+0.12))+(i2*(w(n)+0.12))+(1*0);
    out_h(b)= 1/(1+exp(-net_h(b)));
    m=m+2;
    n=n+2;
end
for c=1:output_units
    net_o(c)=(out_h(1)*(w(m)+0.12))+(out_h(2)*(w(n)+0.12))+(1*0);
    out_o(c)=1/(1+exp(-net_o(c)));
    m=m+2;
    n=n+2;
end

while ~(o1==out_o(1) && o2==out_o(2))

    m=1;
    n=2;
for b=1:hidden_units
    net_h(b)=(i1*(w(m)+0.12))+(i2*(w(n)+0.12))+(1*0);
    out_h(b)= 1/(1+exp(-net_h(b)));
    m=m+2;
    n=n+2;

end
for c=1:output_units
    net_o(c)=(out_h(1)*(w(m)+0.12))+(out_h(2)*(w(n)+0.12))+(1*0);
    out_o(c)=1/(1+exp(-net_o(c)));
    out_o(c)=round((out_o(c)),3);
    m=m+2;
    n=n+2;
end


    
error1 = ((o1-out_o(1))*(o1-out_o(1)))/2;
error2 = ((o2-out_o(2))*(o2-out_o(2)))/2;
error_total=error1+error2;
display(out_o(1));
display(out_o(2));
    

error_in_w1_wrt_o1 = -(o1-out_o(1))*out_o(1)*(1-out_o(1))*w(5)*out_h(1)*(1-out_h(1))*i1;
error_in_w1_wrt_o2 = -(o2-out_o(2))*out_o(2)*(1-out_o(2))*w(7)*out_h(1)*(1-out_h(1))*i1;
error_in_w1 = error_in_w1_wrt_o1+error_in_w1_wrt_o2;

error_in_w2_wrt_o1 = -(o1-out_o(1))*out_o(1)*(1-out_o(1))*w(5)*out_h(1)*(1-out_h(1))*i2;
error_in_w2_wrt_o2 = -(o2-out_o(2))*out_o(2)*(1-out_o(2))*w(7)*out_h(1)*(1-out_h(1))*i2;
error_in_w2 = error_in_w2_wrt_o1+error_in_w2_wrt_o2;

error_in_w3_wrt_o1 = -(o1-out_o(1))*out_o(1)*(1-out_o(1))*w(6)*out_h(2)*(1-out_h(2))*i1;
error_in_w3_wrt_o2 = -(o2-out_o(2))*out_o(2)*(1-out_o(2))*w(8)*out_h(2)*(1-out_h(2))*i1;
error_in_w3 = error_in_w3_wrt_o1+error_in_w3_wrt_o2;

error_in_w4_wrt_o1 = -(o1-out_o(1))*out_o(1)*(1-out_o(1))*w(6)*out_h(2)*(1-out_h(2))*i2;
error_in_w4_wrt_o2 = -(o2-out_o(2))*out_o(2)*(1-out_o(2))*w(8)*out_h(2)*(1-out_h(2))*i2;
error_in_w4 = error_in_w4_wrt_o1+error_in_w4_wrt_o2;


error_in_w5 = -(o1-out_o(1))*out_o(1)*(1-out_o(1))*out_h(1);


error_in_w6 = -(o1-out_o(1))*out_o(1)*(1-out_o(1))*out_h(2);


error_in_w7 = -(o2-out_o(2))*out_o(2)*(1-out_o(2))*out_h(1);



error_in_w8 = -(o2-out_o(2))*out_o(2)*(1-out_o(2))*out_h(2);

w(1) = w(1) - (lr*error_in_w1);
w(2) = w(2) - (lr*error_in_w2);
w(3) = w(3) - (lr*error_in_w3);
w(4) = w(4) - (lr*error_in_w4);
w(5) = w(5) - (lr*error_in_w5);
w(6) = w(6) - (lr*error_in_w6);
w(7) = w(7) - (lr*error_in_w7);
w(8) = w(8) - (lr*error_in_w8);

end
disp('The target value is achieved')
disp('Program created by Ashwin.R')