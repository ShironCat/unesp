LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY memoria IS
	PORT (	iSW: IN STD_LOGIC_VECTOR (10 downto 0);
			iKEY: IN STD_LOGIC_VECTOR (0 downto 0);
			oHEX0_D : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			oHEX0_DP : OUT STD_LOGIC;
			oHEX1_D : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
			oHEX1_DP : OUT STD_LOGIC
	);
END memoria;

ARCHITECTURE memoriabehavior OF memoria IS

	COMPONENT registrador IS 
		PORT (
			iSW : IN STD_LOGIC_VECTOR(7 downto 0);
			iKEY: IN STD_LOGIC_VECTOR(0 downto 0);
			oSW : OUT STD_LOGIC_VECTOR(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT BinToHex8 IS
		PORT (
			iSW : 	   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			oHEX0_D :  OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			oHEX1_D :  OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			oHEX0_DP : OUT STD_LOGIC;
			oHEX1_DP : OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL e1: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL e2: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL e3: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL e4: STD_LOGIC_VECTOR(7 downto 0);
	
	SIGNAL s1: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL s2: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL s3: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL s4: STD_LOGIC_VECTOR(7 downto 0);
	
	SIGNAL e:  STD_LOGIC_VECTOR(7 downto 0);
	
BEGIN

	registrador1: registrador port map( e1(7 downto 0), iKEY(0 downto 0), s1(7 downto 0) );
	registrador2: registrador port map( e2(7 downto 0), iKEY(0 downto 0), s2(7 downto 0) );
	registrador3: registrador port map( e3(7 downto 0), iKEY(0 downto 0), s3(7 downto 0) );
	registrador4: registrador port map( e4(7 downto 0), iKEY(0 downto 0), s4(7 downto 0) );
	
	display:BinToHex8 port map( e, oHEX0_D, oHEX1_D, oHEX0_DP, oHEX1_DP );
	
	
	PROCESS(iKEY(0), iSW(10))
	BEGIN
		-- 1: escreve no registrador
		IF iKEY(0)'EVENT AND iKEY(0) = '1' THEN
			IF iSW(10) = '1' THEN
				IF iSW(9) = '0' AND iSW(8) ='0' THEN
					e1 <= iSW(7 downto 0);
					
				ELSIF iSW(9) = '0' AND iSW(8) ='1' THEN
					e2 <= iSW(7 downto 0);
			
				ELSIF iSW(9) = '1' AND iSW(8) ='0' THEN
					e3 <= iSW(7 downto 0);
					
				ELSIF iSW(9) = '1' AND iSW(8) ='1' THEN
					e4 <= iSW(7 downto 0);
					
				END IF;
				-- 0: LER (mostrar no display)
			ELSIF iKEY(0)'EVENT AND iKEY(0) = '1'THEN
				IF iSW(10) = '0' THEN
					IF iSW(9) = '0' AND iSW(8) ='0' THEN
						e <= s1;
					ELSIF iSW(9) = '0' AND iSW(8) ='1' THEN
						e <= s2;
							
					ELSIF iSW(9) = '1' AND iSW(8) ='0' THEN
						e <= s3;
						
					ELSIF iSW(9) = '1' AND iSW(8) ='1' THEN
						e <= s4;
						
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;
END memoriabehavior;
