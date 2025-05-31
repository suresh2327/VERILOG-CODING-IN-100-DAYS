// Code your design here
module mealyfsm(x,clk,z);
  input x,clk;
  output reg z;
  // States: 
  parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
  // Name of the States: Preset_state, next_state
    reg[1:0]present_state=s0,next_state;
    always@(posedge clk)begin
      present_state<=next_state;
    end
    always@(*)begin
      case(present_state)
        s0:
          if(x==1)begin
            z=1;
            next_state=s1;
        end
        else
          begin
            z=0;
            next_state=s0;
          end
        s1: 
          if(x==1) begin
            z=0;
        next_state=s2;
        end
        else 
          begin
            z=1;
            next_state=s1;
          end
        s2: 
          if(x==1) begin
            z=1;
        next_state=s3;
        end
        else
          begin
            z=0;
            next_state=s2;
          end
        s3:
          if(x==1) begin
            z=1;
            next_state=s1;
          end
        else
          begin
            z=1;
            next_state=s3;
          end
      endcase
    end
  endmodule
