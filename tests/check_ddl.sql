DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.tables
        WHERE table_schema = 'public'
          AND table_name = 'departments'
    ) THEN
        RAISE EXCEPTION 'Test failed: departments table is missing';
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.tables
        WHERE table_schema = 'public'
          AND table_name = 'students'
    ) THEN
        RAISE EXCEPTION 'Test failed: students table is missing';
    END IF;

    RAISE NOTICE 'All table existence tests passed!';
END $$;