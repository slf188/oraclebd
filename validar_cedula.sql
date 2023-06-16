
CREATE OR REPLACE FUNCTION validar_cedula(p_cedula VARCHAR2) RETURN NUMBER IS
   v_tercer_digito NUMBER;
   v_coeficientes SYS.ODCINUMBERLIST := SYS.ODCINUMBERLIST(2, 1, 2, 1, 2, 1, 2, 1, 2);
   v_verificador NUMBER;
   v_suma NUMBER := 0;
   v_digito NUMBER := 0;
BEGIN
   IF p_cedula IS NULL OR LENGTH(p_cedula) != 10 THEN
      RETURN 0;
   END IF;

   BEGIN
      v_tercer_digito := TO_NUMBER(SUBSTR(p_cedula, 3, 1));
      IF v_tercer_digito < 0 OR v_tercer_digito > 5 THEN
         RETURN 0;
      END IF;

      v_verificador := TO_NUMBER(SUBSTR(p_cedula, 10, 1));

      FOR i IN 1..9 LOOP
         v_digito := TO_NUMBER(SUBSTR(p_cedula, i, 1)) * v_coeficientes(i);
         v_suma := v_suma + FLOOR(v_digito / 10) + MOD(v_digito, 10);
      END LOOP;

      IF (v_suma MOD 10 = 0) OR (v_verificador = 0 OR v_verificador = 10 - (v_suma MOD 10)) THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
   EXCEPTION
      WHEN OTHERS THEN
         RETURN 0;
   END;
END;
