ALTER SESSION SET nls_date_format = 'MM/DD/YYYY';

DROP TABLE ss_audit_log;

CREATE TABLE ss_audit_log (
    log_id            INTEGER NOT NULL,
    tbl               VARCHAR2(255),
    col               VARCHAR2(255),
    message           VARCHAR2(255),
    id_of_occurance   VARCHAR2(255),
    time_stamp        DATE,
    CONSTRAINT pk_log_id PRIMARY KEY ( log_id )
);

DROP SEQUENCE audit_seq;

CREATE SEQUENCE audit_seq START WITH 1 INCREMENT BY 1;

INSERT INTO ss_audit_log
    ( SELECT
        audit_seq.NEXTVAL,
        'lds_placement',
        'year',
        'Invalid Date. Greater than current date!',
        placement_id,
        SYSDATE
      FROM
        ss_temp_unclean
      WHERE
        year > EXTRACT(YEAR FROM SYSDATE)
    );

INSERT INTO ss_audit_log
    ( SELECT
        audit_seq.NEXTVAL,
        'lds_placement',
        'year',
        'Invalid Date. Greater than current date!',
        placement_id,
        SYSDATE
      FROM
        ss_temp_unclean
      WHERE
        job_role != lower(job_role)
    );