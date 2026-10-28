 SQL Homework — PostgreSQL Testing

 About the Project

This project demonstrates SQL table creation, database constraints, and automated SQL execution using PostgreSQL and GitHub Actions.

 Technologies

- PostgreSQL
- SQL
- Git and GitHub
- GitHub Actions

 Database Schema

The project includes two tables:

- `departments` — stores department information.
- `students` — stores student information and GPA.

The schema uses primary keys, a foreign key, a unique constraint, and a GPA range check.

Automated Testing

GitHub Actions automatically runs the SQL scripts when changes are pushed to the repository.

The workflow checks that the SQL scripts execute successfully and that the required tables exist.

 Project Structure

```text
SQL-homework/
├── .github/
│   └── workflows/
│       └── check_sql.yml
├── solution/
│   └── homework.sql
├── tests/
│   └── check_ddl.sql
└── README.md
```

 Learning Goals

- Practice PostgreSQL and SQL.
- Understand relational database constraints.
- Learn Git and GitHub workflows.
- Practice automated database testing.
