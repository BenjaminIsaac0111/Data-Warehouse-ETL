ALTER SESSION SET nls_date_format = 'MM/DD/YYYY';

DROP TABLE ss_temp_unclean;

DROP TABLE ss_temp_clean;

DROP TABLE ss_audit_log;

DROP SEQUENCE audit_seq;

CREATE SEQUENCE audit_seq START WITH 1 INCREMENT BY 1;

--Build a cleansing area where the data will first be loaded for checks quality checks
--No NOT NULL contraints have been made here because we want the data in one place, regardless of quality,
--to simplify the error checking process by looking at a single table.

CREATE TABLE ss_temp_unclean (
    placement_id    VARCHAR2(255),
    job_role        VARCHAR2(255),
    year            INTEGER,
    actual_salary   INTEGER
);

--Create a clean data table where checked data will be placed before being put into the SS tables. Constraints now added.

CREATE TABLE ss_temp_clean (
    placement_id    VARCHAR2(255) NOT NULL,
    job_role        VARCHAR2(255) NOT NULL,
    year            INTEGER NOT NULL,
    actual_salary   INTEGER NOT NULL,
    CONSTRAINT pk_placement_id PRIMARY KEY ( placement_id )
);

CREATE TABLE ss_audit_log (
    log_id             INTEGER NOT NULL,
    id_of_occurrence   VARCHAR2(255),
    errcode            VARCHAR2(8),
    col                VARCHAR2(255),
    message            VARCHAR2(255),
    item_in_question   VARCHAR2(255),
    time_stamp         DATE,
    checked            VARCHAR2(16),
    CONSTRAINT pk_log_id PRIMARY KEY ( log_id )
);

--Audit log will log any discrepancy with the data and add error codes to indentifly what type of 
--data error for precision checking.
--Error codes examples; err:1 = Invalid Data; err:2 = IS NULL; err:3 = Abnormal Value
CREATE OR REPLACE EDITIONABLE TRIGGER "AUDIT_LOGGER" AFTER
    INSERT ON ss_temp_unclean
BEGIN
--Find any dates that are greater than the current date and log it.
    INSERT INTO ss_audit_log
        ( SELECT
            audit_seq.NEXTVAL,
            placement_id,
            'err:1',
            'year',
            'Invalid Date. Greater than current date!',
            year,
            SYSDATE,
            'Unchecked'
          FROM
            ss_temp_unclean
          WHERE
            year > EXTRACT(YEAR FROM SYSDATE)
        );

    INSERT INTO ss_audit_log
        ( SELECT
            audit_seq.NEXTVAL,
            placement_id,
            'err:2',
            'job_role',
            'Is Null!',
            '(null)',
            SYSDATE,
            'Unchecked'
          FROM
            ss_temp_unclean
          WHERE
            job_role IS NULL
        );

--Find potential Outliers that may be errors i.e a value that is dispersed so abnormally far from the median.    
    INSERT INTO ss_audit_log
        ( SELECT
            audit_seq.NEXTVAL,
            ss_temp_unclean.placement_id,
            'err:3',
            'actual_salary',
            'Value abnormally far from the median!',
            actual_salary,
            SYSDATE,
            'Unchecked'
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
          --Coefficiant may need to be ajusted depedant on what the boundries are.
            dispersion_from_median >= 10 * (
                SELECT
                    MEDIAN(actual_salary) AS med
                FROM
                    ss_temp_unclean
            )
        );

END;
/

ALTER TRIGGER "AUDIT_LOGGER" ENABLE;

--Load the data from the Leeds and Manchester placement tables. 
--ID has been made unique by concatinating a prefix onto the original ID.
--This was done because else we would have matching instances of id coming from both tables.
--Done a join on the leeds placement table because the acutal job role was referenced by a foreign key to the job_role table.
--Lowered all job titles for easier LIKE comparisons.

INSERT INTO ss_temp_unclean
    ( SELECT
        'LDS'
        || placement_id,
        lower(lds_job_role.job_role_desc),
        EXTRACT(YEAR FROM plt_required_start_date) AS year,
        actual_salary
      FROM
        lds_placement
        INNER JOIN lds_job_role ON lds_job_role.job_role_id = lds_placement.fk3_job_role_id
    UNION
    SELECT
        'MAN'
        || placement_id,
        lower(plt_short_desc),
        EXTRACT(YEAR FROM plt_required_start_date) AS year,
        actual_salary
    FROM
        su_job
    );
 
--Cleaning
   
--Make NULL job_role values 'Unknown'. Will still insert because report may not be dependant on job_role values
--and a report could be that we want to see analyse the unknown roles in some manner.
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
    


--Update the audit to say that the value has been checked
UPDATE ss_audit_log
    SET
    checked = 'checked'
    WHERE col LIKE '%job_role%' AND errcode LIKE '%err:2%';


--Because of the nature of the reports that this data mart will support, I
--needed to completly remove any of the values because they will affect the statisical values needed to create an accurate report.
--Cannot replace the salaries with values that may, for example affect the mean, max or min. Removing them will keep the reports concise and accurate. 
--The same goes for years and groupings on rolling averages.
INSERT INTO ss_temp_clean
    ( SELECT
        placement_id,
        job_role,
        year,
        actual_salary
      FROM
        ss_temp_unclean
      WHERE
        placement_id NOT IN (
            SELECT
                id_of_occurrence
            FROM
                ss_audit_log
            WHERE
                ss_audit_log.checked LIKE '%Unchecked%'
        )
    );