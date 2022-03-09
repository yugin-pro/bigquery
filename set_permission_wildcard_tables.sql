FOR dateList IN
  (
  SELECT  DISTINCT _TABLE_SUFFIX date
   FROM `raiffeisen-owox.OWOXBI_CostData.dbm_cost_data_report_*`
   )
DO
  EXECUTE IMMEDIATE format("""
 GRANT `roles/bigquery.dataViewer` ON TABLE `raiffeisen-owox.OWOXBI_CostData.dbm_cost_data_report_%s`
 TO "group:rbru-mgcom@googlegroups.com"
""", dateList.date);
END FOR;
