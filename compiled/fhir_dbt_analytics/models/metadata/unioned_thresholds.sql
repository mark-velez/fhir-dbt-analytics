


        (
            select
                cast('`aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`thresholds`' as STRING) as thresholds_source,

                
                    cast(`metric_name` as STRING) as `metric_name` ,
                    cast(`threshold_low` as FLOAT64) as `threshold_low` ,
                    cast(`threshold_high` as FLOAT64) as `threshold_high` ,
                    cast(`time_grain` as STRING) as `time_grain` ,
                    cast(`dimension` as STRING) as `dimension` ,
                    cast(`validation_feature` as STRING) as `validation_feature` ,
                    cast(`severity` as STRING) as `severity` 

            from `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`thresholds`

            
        )

        