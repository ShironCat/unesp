LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity modularizador is 
	port(
		iCLK_28 : in std_logic;
		ss: OUT STD_LOGIC
	);
end modularizador;

architecture modularizadorCircuito of modularizador is
	signal x : integer := 0;
	signal saida : std_logic;
begin
	process (iCLK_28)
	begin
		if iCLK_28'event and iCLK_28 = '1' then
			x <= x + 1;
			if x = 10000000 then
				saida <= '1';
				x <= 0;
			else
				saida <= '0';
			end if;
		end if;
	end process;
	ss <= saida;
end modularizadorCircuito;