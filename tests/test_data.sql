DO $$
BEGIN
    BEGIN
        INSERT INTO departments (department_name)
        VALUES ('Test Department');

        INSERT INTO students (student_name, gpa, department_id)
        VALUES ('Test Student', 5.00, (
            SELECT department_id
            FROM departments
            WHERE department_name = 'Test Department'
        ));

        RAISE EXCEPTION 'Test failed: GPA 5.00 was accepted';

    EXCEPTION
        WHEN check_violation THEN
            RAISE NOTICE 'Test passed: invalid GPA was rejected';
    END;
END $$;