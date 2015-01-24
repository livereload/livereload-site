ALTER TABLE licenses ADD COLUMN claim_full_name VARCHAR NULL;
ALTER TABLE licenses ADD COLUMN claim_message TEXT NULL;

INSERT INTO stores(code, name) VALUES ('Paddle', 'Paddle');
INSERT INTO stores(code, name) VALUES ('manual', '(Manual)');
