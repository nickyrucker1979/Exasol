MERGE INTO UNIVERSITY_WAREHOUSE_DEV.LINKEDIN_CAMPAIGNS dev
    USING UNIVERSITY_WAREHOUSE_STAGING.LINKEDIN_CAMPAIGNS stg
    ON (dev.ID = stg.ID)
    WHEN MATCHED THEN UPDATE SET
         dev.CAMPAIGN_NAME = stg.CAMPAIGN_NAME,
         dev.OBJECTIVE_TYPE = stg.OBJECTIVE_TYPE,
         dev.CREATED_DATE = stg.CREATED_DATE,
         dev.MODIFIED_DATE = stg.MODIFIED_DATE,
         dev.COST_TYPE = stg.COST_TYPE,
         dev.DAILY_BUDGET = stg.DAILY_BUDGET,
         dev.TOTAL_BUDGET_AMOUNT = stg.TOTAL_BUDGET_AMOUNT,
         dev.CAMPAIGN_TYPE = stg.CAMPAIGN_TYPE,
         dev.UNIT_COST_AMOUNT = stg.UNIT_COST_AMOUNT,
         dev.CREATIVE_SELECTION = stg.CREATIVE_SELECTION,
         dev.START_DATE = stg.START_DATE,
         dev.END_DATE = stg.END_DATE
      WHERE dev.ID = stg.ID
    WHEN NOT MATCHED THEN INSERT VALUES
      (
         stg.ACCOUNT,
         stg.ID,
         stg.CAMPAIGN_NAME,
         stg.OBJECTIVE_TYPE,
         stg.CREATED_DATE,
         stg.MODIFIED_DATE,
         stg.COST_TYPE,
         stg.DAILY_BUDGET,
         stg.TOTAL_BUDGET_AMOUNT,
         stg.CAMPAIGN_TYPE,
         stg.UNIT_COST_AMOUNT,
         stg.CREATIVE_SELECTION,
         stg.START_DATE,
         stg.END_DATE
      );
