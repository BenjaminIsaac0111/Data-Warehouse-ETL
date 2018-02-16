
  CREATE OR REPLACE EDITIONABLE TRIGGER "C##C3444086"."AUDIT_LOGGER" AFTER
    INSERT OR UPDATE OF actual_salary,job_role,placement_id,year ON ss_temp_unclean
BEGIN
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

END;
/
ALTER TRIGGER "C##C3444086"."AUDIT_LOGGER" ENABLE;
