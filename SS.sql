DROP TABLE SS_FACT_TABLE;
DROP TABLE SS_PLACEMENT_DIM;
DROP TABLE SS_TIME_DIM;


CREATE TABLE SS_PLACEMENT_DIM(
	placement_id	INTEGER NOT NULL,
	placement_name	INTEGER,
	job_role	VARCHAR(255) NOT NULL,
	actual_salary	INTEGER NOT NULL,
	CONSTRAINT	pk_SS_PLACEMENT_DIM PRIMARY KEY (placement_id)
);


CREATE TABLE SS_TIME_DIM(
	time_id	INTEGER NOT NULL,
	year	INTEGER NOT NULL UNIQUE,
	CONSTRAINT	pk_SS_TIME_DIM PRIMARY KEY (time_id)
);

CREATE TABLE SS_FACT_TABLE(
	placement_id INTEGER NOT NULL,
	time_id	INTEGER NOT NULL,
	avg_salary	INTEGER,
	count_of	INTEGER,
	percentile	FLOAT(8),
	CONSTRAINT	fk_placement_dim FOREIGN KEY (placement_id) REFERENCES SS_PLACEMENT_DIM(placement_id),
    CONSTRAINT	fk_time_dim FOREIGN KEY (time_id) REFERENCES SS_TIME_DIM(time_id)
);
    