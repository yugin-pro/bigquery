
DECLARE date DATE DEFAULT '2021-09-14';
DECLARE sfx STRING DEFAULT '20210914';

LOOP
  SET sfx = FORMAT_DATE('%Y%m%d', date) ;
 EXECUTE IMMEDIATE format("""
  DROP TABLE IF EXISTS `raiffeisen-owox.RB_DS_ANALYTICAL_LAYER.cost_%s`
""",sfx);
  SET date = date - 1;
  IF date < '2021-07-01' THEN
    LEAVE;
  END IF;
END LOOP;
