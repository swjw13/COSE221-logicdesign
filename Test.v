module test(in_1, in_2, oper, display_1, display_2, display_3, display_4, display_5);
	input [0:2]in_1;
	input [0:2]in_2;
	input [0:3]oper;
	output reg [0:13]display_1;
	output reg [0:13]display_2;
	output[0:13]display_3;
	output reg [0:6]display_4;
	output reg [0:6]display_5;
	
	assign display_3=14'b11111111111111;
	
	always @(*) begin
		case(in_1)										//피연산자 1번째
			'b001: display_1=14'b00000011001111;
			'b010: display_1=14'b00000010010010;
			'b011: display_1=14'b00000010000110;
			'b100: display_1=14'b00000011001100;
			'b101: display_1=14'b00000010100100;
			'b110: display_1=14'b00000010100000;
			'b111: display_1=14'b00000010001101;
			default : display_1=14'b00000010000001;
		endcase
		case(in_2)										//피연산자 2번째
			'b001: display_2=14'b00000011001111;
			'b010: display_2=14'b00000010010010;
			'b011: display_2=14'b00000010000110;
			'b100: display_2=14'b00000011001100;
			'b101: display_2=14'b00000010100100;
			'b110: display_2=14'b00000010100000;
			'b111: display_2=14'b00000010001101;
			default : display_2=14'b00000010000001;
		endcase
		case(oper)
			'b0000: begin								//초기상황
				display_4=7'b0000001;
				display_5=7'b0000001;
			end
			
			'b1000: begin								//덧셈
					case((in_1+in_2)%10)
						1: display_5=7'b1001111;
						2: display_5=7'b0010010;
						3: display_5=7'b0000110;
						4: display_5=7'b1001100;
						5: display_5=7'b0100100;
						6: display_5=7'b0100000;
						7: display_5=7'b0001101;
						8: display_5=7'b0000000;
						9: display_5=7'b0001100;
						default: display_5=7'b0000001;
					endcase
				if(in_1+in_2>=10)
					display_4=7'b1001111;
				else
					display_4=7'b0000001;
			end
			
			
			'b0100: begin								//뻴셈
				if(in_1>=in_2)
					display_4=7'b0000001;
				else
					display_4=7'b1111110;
				case((in_1-in_2)*(in_1-in_2))
						1: display_5=7'b1001111;
						4: display_5=7'b0010010;
						9: display_5=7'b0000110;
						16: display_5=7'b1001100;
						25: display_5=7'b0100100;
						36: display_5=7'b0100000;
						49: display_5=7'b0001101;
						default: display_5=7'b0000001;
				endcase
			end
			
			'b0010: begin								//곱셈
				case((in_1*in_2)/10)
					1: display_4=7'b1001111;
					2: display_4=7'b0010010;
					3: display_4=7'b0000110;
					4: display_4=7'b1001100;
					default: display_4=7'b0000001;
				endcase
				case((in_1*in_2)%10)
					1: display_5=7'b1001111;
					2: display_5=7'b0010010;
					3: display_5=7'b0000110;
					4: display_5=7'b1001100;
					5: display_5=7'b0100100;
					6: display_5=7'b0100000;
					7: display_5=7'b0001101;
					8: display_5=7'b0000000;
					9: display_5=7'b0001100;
					default: display_5=7'b0000001;
				endcase
			end
			
			'b0001: begin								//나눗셈
				if(in_2==0) begin
					display_4=7'b1111110;
					display_5=7'b1001111;
				end
				else begin
					display_4=7'b0000001;
					case(in_1/in_2)
						1: display_5=7'b1001111;
						2: display_5=7'b0010010;
						3: display_5=7'b0000110;
						4: display_5=7'b1001100;
						5: display_5=7'b0100100;
						6: display_5=7'b0100000;
						7: display_5=7'b0001101;
						default: display_5=7'b0000001; //혹시모르니
					endcase
					end
				end
			default : begin 
				display_4=7'b1111110;
				display_5=7'b1001111;
			end
		endcase
	end
	
	endmodule