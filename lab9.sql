CREATE OR REPLACE FUNCTION increase_value(input_value INT)
RETURNS INT AS $$
BEGIN
    RETURN input_value + 10;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION compare_numbers(num1 INT, num2 INT)
RETURNS TEXT AS $$
BEGIN
    IF num1 > num2 THEN
        RETURN 'Greater';
    ELSIF num1 = num2 THEN
        RETURN 'Equal';
    ELSE
        RETURN 'Lesser';
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION number_series(n INT)
RETURNS TABLE(number INT) AS $$
BEGIN
    RETURN QUERY
    SELECT generate_series(1, n);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION find_employee(emp_name TEXT)
RETURNS TABLE(employee_id INT, name TEXT, position TEXT) AS $$
BEGIN
    RETURN QUERY
    SELECT id, name, position
    FROM employees
    WHERE name = emp_name;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION list_products(category TEXT)
RETURNS TABLE(product_id INT, name TEXT, price NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT id, name, price
    FROM products
    WHERE category = category;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION calculate_bonus(employee_id INT)
RETURNS NUMERIC AS $$
DECLARE
    bonus NUMERIC;
BEGIN
    SELECT salary * 0.1 INTO bonus
    FROM employees
    WHERE id = employee_id;
    RETURN bonus;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_salary(employee_id INT)
RETURNS VOID AS $$
DECLARE
    bonus NUMERIC;
BEGIN
    bonus := calculate_bonus(employee_id);
    UPDATE employees
    SET salary = salary + bonus
    WHERE id = employee_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION complex_calculation(num1 INT, str1 TEXT)
RETURNS TEXT AS $$
DECLARE
    numeric_result INT;
    string_result TEXT;
BEGIN
    DO $$ 
    BEGIN
        numeric_result := num1 * 10;
    END $$;

    DO $$
    BEGIN
        string_result := upper(str1);
    END $$;

    RETURN 'Numeric: ' || numeric
