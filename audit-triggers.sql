DROP TABLE IF EXISTS carbuilder.customers_audit_log;
DROP TRIGGER IF EXISTS carbuilder.customer_insert_audit_trigger;
CREATE TABLE carbuilder.customers_audit_log (
    c_id BIGINT NOT NULL,
    old_row_data JSON,
    new_row_data JSON,
    dml_type ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    dml_timestamp TIMESTAMP NOT NULL,
    dml_created_by VARCHAR(255) NOT NULL,
    PRIMARY KEY (c_id, dml_type, dml_timestamp)
);


DELIMITER //
CREATE TRIGGER customer_insert_audit_trigger
AFTER INSERT ON customers FOR EACH ROW
BEGIN
    INSERT INTO customers_audit_log (
        c_id,
        old_row_data,
        new_row_data,
        dml_type,
        dml_timestamp,
        dml_created_by
    ) VALUES (
        NEW.c_id,
        null,
        JSON_OBJECT(
			"c_id", NEW.c_id,
			"c_name", NEW.c_name,
			"c_phone", NEW.c_phone,
			"c_email", NEW.c_email,
			"c_number", NEW.c_number,
			"c_floor", NEW.c_floor,
			"c_street", NEW.c_street,
			"c_zip", NEW.c_zip,
			"c_city", NEW.c_city,
			"c_country", NEW.c_country
        ),
        'INSERT',
        CURRENT_TIMESTAMP,
        CURRENT_USER()
    );
    END //
    DELIMITER ;
   
    




