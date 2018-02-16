ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY';

DROP TABLE ss_temp_unclean;
DROP TABLE ss_temp_clean;

--Build a cleansing area where the data will first be loaded for checks quality checks
CREATE TABLE ss_temp_unclean(
    placement_id VARCHAR2(255) NOT NULL,
    job_role VARCHAR2(255)NOT NULL,
    year INTEGER NOT NULL,
    actual_salary INTEGER,
    constraint pk_placement_id_unclean primary key (placement_id)
);

--Load the data from the Leeds and Manchester placement tables. 
--ID has been made unique by concatinating a prefix onto the original ID.
--This was done because else we would have matching instances of id coming from both tables.
--Done a join on the leeds placement table because the acutal job role was referenced by a foreign key to the job_role table.

INSERT INTO ss_temp_unclean
    ( SELECT
        'LDS'
        || placement_id,
        LOWER(lds_job_role.job_role_desc),
        EXTRACT(YEAR FROM plt_required_start_date) AS year,
        actual_salary
      FROM
        lds_placement
        INNER JOIN lds_job_role ON lds_job_role.job_role_id = lds_placement.fk3_job_role_id
    UNION
    SELECT
        'MAN'
        || placement_id,
        LOWER(plt_short_desc),
        EXTRACT(YEAR FROM plt_required_start_date) AS year,
        actual_salary
    FROM
        su_job
    );

--Create a clean data table where check data will be placed before being put into the SS tables.
CREATE TABLE ss_temp_clean(
    placement_id VARCHAR2(255) NOT NULL,
    job_role VARCHAR2(255)NOT NULL,
    YEAR INTEGER NOT NULL,
    actual_salary INTEGER NOT NULL,
    CONSTRAINT pk_placement_id PRIMARY KEY (placement_id)
);

--Apon insert to the cleaned table, a trigger will do final checks
INSERT INTO ss_temp_clean
    ( SELECT
        *
      FROM
        ss_temp_unclean
    );
  
SELECT
    year,
    averagesal,
    round(AVG(averagesal) OVER(
        ORDER BY
            year
        ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
    ),0) AS running_avg,
    count
FROM
    (
        SELECT
            EXTRACT(YEAR FROM TO_DATE(TO_CHAR(plt_required_start_date,'DD/MM/YYYY'),'MM/DD/YYYY') ) AS year,
            round(AVG(actual_salary),2) AS averagesal,
            COUNT(*) AS count
        FROM
            lds_placement
        GROUP BY
            EXTRACT(YEAR FROM TO_DATE(TO_CHAR(plt_required_start_date,'DD/MM/YYYY'),'MM/DD/YYYY') )
    )
ORDER BY
    year;
    
 
    
