DO $$
BEGIN
    -- 1. Check that departments table exists
    IF to_regclass('public.departments') IS NULL THEN
        RAISE EXCEPTION 'Test failed: departments table is missing';
    END IF;

    -- 2. Check that students table exists
    IF to_regclass('public.students') IS NULL THEN
        RAISE EXCEPTION 'Test failed: students table is missing';
    END IF;

    -- 3. Check primary key on departments
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE table_schema = 'public'
          AND table_name = 'departments'
          AND constraint_type = 'PRIMARY KEY'
    ) THEN
        RAISE EXCEPTION 'Test failed: departments primary key is missing';
    END IF;

    -- 4. Check primary key on students
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE table_schema = 'public'
          AND table_name = 'students'
          AND constraint_type = 'PRIMARY KEY'
    ) THEN
        RAISE EXCEPTION 'Test failed: students primary key is missing';
    END IF;

    -- 5. Check foreign key on students
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE table_schema = 'public'
          AND table_name = 'students'
          AND constraint_type = 'FOREIGN KEY'
    ) THEN
        RAISE EXCEPTION 'Test failed: students foreign key is missing';
    END IF;

    -- 6. Check unique constraint on departments
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE table_schema = 'public'
          AND table_name = 'departments'
          AND constraint_type = 'UNIQUE'
    ) THEN
        RAISE EXCEPTION 'Test failed: department unique constraint is missing';
    END IF;

    -- 7. Check GPA constraint
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.check_constraints
        WHERE constraint_schema = 'public'
          AND constraint_name IN (
              SELECT constraint_name
              FROM information_schema.table_constraints
              WHERE table_schema = 'public'
                AND table_name = 'students'
                AND constraint_type = 'CHECK'
          )
    ) THEN
        RAISE EXCEPTION 'Test failed: students GPA check constraint is missing';
    END IF;

    RAISE NOTICE 'All schema tests passed!';
END $$;