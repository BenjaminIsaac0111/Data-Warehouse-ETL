--Find potential Outliers that may be errors i.e a value that is dispersed so abnormally far from the median.
SELECT
    ss_temp_unclean.placement_id,
    job_role,
    actual_salary,
    year,
    r.dispersion_from_median
FROM
    ss_temp_unclean
    INNER JOIN (
        SELECT
            placement_id,
            abs(actual_salary - med) AS dispersion_from_median
        FROM
            (
                SELECT
                    MEDIAN(actual_salary) AS med
                FROM
                    ss_temp_unclean
            ),
            ss_temp_unclean
    ) r ON r.placement_id = ss_temp_unclean.placement_id
WHERE
    dispersion_from_median >= 10 * (
        SELECT
            MEDIAN(actual_salary) AS med
        FROM
            ss_temp_unclean
    );

--Filter out by the the errors logged in the audit table.
SELECT
    year,
    averagesal,
    round(AVG(averagesal) OVER(
        ORDER BY
            year
        ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
    ),0) AS running_avg,
    count AS count_of_job_positions
FROM
    (
        SELECT
            year,
            round(AVG(actual_salary),0) AS averagesal,
            COUNT(*) AS count
        FROM
            ss_temp_unclean
        WHERE
            NOT EXISTS (
                SELECT
                    id_of_occurrence
                FROM
                    ss_audit_log t1
                WHERE
                    t1.id_of_occurrence = ss_temp_unclean.placement_id
            ) AND job_role LIKE '%analyst%'
        GROUP BY
            year
    )
ORDER BY
    year;

--Make NULL job_role values 'Unknown'.    
UPDATE ss_temp_unclean
    SET
        job_role = 'Unknown'
WHERE placement_id IN(
        SELECT
            placement_id
        FROM
            ss_audit_log,
            ss_temp_unclean
        WHERE
            ss_temp_unclean.placement_id = ss_audit_log.id_of_occurrence
            AND  ss_audit_log.errcode LIKE '%err:2%'
    );


SELECT
    placement_id,
    job_role,
    actual_salary,
    dispersion,
    MEDIAN(dispersion) OVER (PARTITION BY job_role)
FROM
    (
            (
                select
                    abs(actual_salary - MEDIAN(actual_salary))  AS dispersion
                from
                    ss_temp_unclean
                GROUP BY actual_salary
            )
    ),ss_temp_unclean;
select 
placement_id,
            job_role,
    abs(actual_salary - med)
FROM
    (
        select
            placement_id,
            job_role,
            actual_salary,
            MEDIAN(actual_salary) OVER (PARTITION BY job_role) AS med
        FROM
            ss_temp_unclean
        ORDER BY
            actual_salary
    );
SELECT
    placement_id,
    job_role,
    actual_salary,
    dispersion,
    MEDIAN(dispersion) OVER (PARTITION BY job_role)
FROM
    (
            (
                select
                    abs(actual_salary - MEDIAN(actual_salary))  AS dispersion
                from
                    ss_temp_unclean
                GROUP BY actual_salary
            )
    ),ss_temp_unclean;



select 
placement_id,
            job_role,
    abs(actual_salary - med)
FROM
    (
        select
            placement_id,
            job_role,
            actual_salary,
            MEDIAN(actual_salary) OVER (PARTITION BY job_role) AS med
        FROM
            ss_temp_unclean
        ORDER BY
            actual_salary
    );
SELECT
    placement_id,
    job_role,
    actual_salary
FROM
    (
        SELECT
            abs(actual_salary - med) AS dispersion
        FROM
            (
                SELECT
                    MEDIAN(actual_salary) AS med
                FROM
                    ss_temp_unclean
                ORDER BY
                    actual_salary
            ),
            ss_temp_unclean
    ),ss_temp_unclean
    WHERE actual_salary >= 10*dispersion;
select 
placement_id,
            job_role,
    abs(actual_salary - med)
FROM
    (
        select
            placement_id,
            job_role,
            actual_salary,
            MEDIAN(actual_salary) OVER (PARTITION BY job_role) AS med
        FROM
            ss_temp_unclean
        ORDER BY
            actual_salary
    );
SELECT
    placement_id,
    job_role,
    actual_salary
FROM
    (
        SELECT
            abs(actual_salary - med) AS dispersion
        FROM
            (
                SELECT
                    MEDIAN(actual_salary) AS med
                FROM
                    ss_temp_unclean
                ORDER BY
                    actual_salary
            ),
            ss_temp_unclean
    ),ss_temp_unclean
    WHERE actual_salary >= 10*dispersion;
select 
placement_id,
            job_role,
    abs(actual_salary - med)
FROM
    (
        select
            placement_id,
            job_role,
            actual_salary,
            MEDIAN(actual_salary) OVER (PARTITION BY job_role) AS med
        FROM
            ss_temp_unclean
        ORDER BY
            actual_salary
    );
    
SET TIMING ON;

SELECT * FROM ss_temp_clean WHERE placement_id = :id;

      
    
    
    
    
    