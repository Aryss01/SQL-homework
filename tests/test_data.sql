BEGIN;

DO $$
DECLARE
    test_department_id INT;
BEGIN
    -- Test 1: GPA must be between 0 and 4
    INSERT INTO departments (department_name)
    VALUES ('GPA Test Department')
    RETURNING department_id INTO test_department_id;

    BEGIN
        INSERT INTO students (student_name, gpa, department_id)
        VALUES ('Invalid GPA Student', 5.00, test_department_id);

        RAISE EXCEPTION 'Test failed: GPA 5.00 was accepted';

    EXCEPTION
        WHEN check_violation THEN
            RAISE NOTICE 'Test passed: invalid GPA was rejected';
    END;

    -- Test 2: Duplicate department name must be rejected
    BEGIN
        INSERT INTO departments (department_name)
        VALUES ('GPA Test Department');

        RAISE EXCEPTION 'Test failed: duplicate department name was accepted';

    EXCEPTION
        WHEN unique_violation THEN
            RAISE NOTICE 'Test passed: duplicate department name was rejected';
    END;
END $$;

ROLLBACK;