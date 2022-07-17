-- order status changes
CREATE OR REPLACE FUNCTION status_changes()
  RETURNS trigger AS
$BODY$
BEGIN
	IF NEW.status_id <> OLD.status_id THEN
		 INSERT INTO product_order(status_id)
		 VALUES(OLD.status_id,now());
	END IF;

	RETURN NEW;
END;
$BODY$

--bind the trigger function to a table 
CREATE TRIGGER order_status_changes
  BEFORE UPDATE
  ON product_order
  FOR EACH ROW
  EXECUTE PROCEDURE status_changes();