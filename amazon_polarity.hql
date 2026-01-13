USE ct6045;

CREATE EXTERNAL TABLE amazon_reviews (
    polarity INT,
    title STRING,
    review_text STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar"     = "\"",
  "escapeChar"    = "\\"
)
STORED AS TEXTFILE
LOCATION '/user/ct6045/data/amazon';

-- Count polarity
SELECT polarity, COUNT(*) AS review_count
FROM amazon_reviews
GROUP BY polarity;
