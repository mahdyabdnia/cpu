module testbanch();
reg d,e;
wire f;
AND dut(d,e,f);
initial 
begin 
a=0;b=1;#50;
a=1;b=1;#50
a=0;b=0;#50;
a=1;b=0;#50;
end
endmodule

