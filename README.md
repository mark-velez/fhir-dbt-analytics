# Getting started

#### **Getting Started** &nbsp; | &nbsp; [Project overview](readme/project_overview.md) &nbsp; | &nbsp; [Extending the project](readme/extending_the_project.md) &nbsp; | &nbsp; [Feedback](http://www.google.com/url?sa=D&q=https://docs.google.com/forms/d/e/1FAIpQLScU0WXCXA7xOX7kGr6QSW9BNMZwHswf5zq10MfRnnZJYQ6L8g/viewform)

---

## What is FHIR dbt analytics?

A dbt project which produces data-quality analytics from FHIR resources stored in BigQuery or Apache Spark.

Use the metrics in **fhir-dbt-analytics** to check the quality of clinical data. The metrics might count the number of [FHIR resources](http://www.google.com/url?sa=D&q=http://build.fhir.org/resourcelist.html) to compare to expected counts or check references between FHIR resources, such as between patients and encounters. Some metrics can help you check the distribution of coded values in your data. You can run all the metrics as a suite, selected metrics, or individually.

Many of the metrics also break down results into different dimensions. For example, the *encounter_count* metric can show counts for different encounter classes (e.g. inpatient, emergency, ambulatory). The project includes the following elements:

- built-in metrics (parameterized so you can easily extend them) to measure clinical data quality
- views which aggregate the results ready for your data-visualization tools

You need to run these analytics tools using [dbt](http://www.google.com/url?sa=D&q=https://docs.getdbt.com/docs/introduction) — an open-source data-transformation tool. If you’re already analyzing FHIR data with dbt, you can take advantage of the macros from this project. The dbt macros can help you build patient cohorts, navigate and extract values from FHIR resources, or inspect BigQuery or Spark datasets. The dbt selectors gather metrics into themes so that you can run just the metrics you’re interested in.


## What you'll need

Before you can run this project, you’ll need the following:

For BigQuery:

- [dbt BigQuery adapter](http://www.google.com/url?sa=D&q=https://docs.getdbt.com/reference/warehouse-setups/bigquery-setup) 1.2.0+ installed on your computer
- A [Google Cloud project](https://cloud.google.com/resource-manager/docs/creating-managing-projects) where you have `bigquery.dataEditor` and `bigquery.user` permissions
- The [gcloud](https://cloud.google.com/sdk/docs/install) command line interface for [authentication](http://www.google.com/url?sa=D&q=https://docs.getdbt.com/reference/warehouse-setups/bigquery-setup#local-oauth-gcloud-setup)

For Spark:

- [dbt Spark adapter](http://www.google.com/url?sa=D&q=https://docs.getdbt.com/reference/warehouse-setups/spark-setup) 1.2.0+ installed on your computer
- A Spark installation with a thriftserver running.


## Install the project

To install the project, run the following commands in your terminal to create a new folder in the current directory:

```
git clone https://github.com/google/fhir-dbt-analytics
cd fhir-dbt-analytics
```


## Setup dbt outputs

Open `profiles.yml` and fill in the project and dataset as indicated in the file.


## Setup source data

By default, the source data are from the BigQuery [Synthea Generated Synthetic Data in FHIR](https://console.cloud.google.com/marketplace/details/mitre/synthea-fhir) public dataset. You can test running the project over this dataset by leaving the defaults unchanged.


### BigQuery source data

To analyze your own data, export them to BigQuery from a Google Cloud FHIR store, following [Storing healthcare data in BigQuery](https://cloud.google.com/architecture/storing-healthcare-data-in-bigquery) and [point the project variables](http://www.google.com/url?sa=D&q=https://docs.getdbt.com/docs/build/project-variables) to it, e.g. by editing the `dbt_project.yml` file:

- **database**: The name of a Google Cloud project which contains your FHIR BigQuery dataset. For example, *bigquery-public-data*.
- **schema**: The name of your FHIR BigQuery dataset. For example, *fhir_synthea*.
- **timezone_default**: The IANA time-zone name. For example, *Europe/London*.


### Spark source data

You can use the https://github.com/google/fhir-data-pipes project to create FHIR data for Spark and [point the project variables](http://www.google.com/url?sa=D&q=https://docs.getdbt.com/docs/build/project-variables) to it, e.g. by editing the `dbt_project.yml` file:

- **database**: Leave empty for Spark.
- **schema**: The name of your Spark schema. For example, *fhir_synthea*.


## Run the project

### First time

The first time that you run the project, you need to [install dependent packages](http://www.google.com/url?sa=D&q=https://docs.getdbt.com/docs/build/packages) and [seed static data](http://www.google.com/url?sa=D&q=https://docs.getdbt.com/docs/build/seeds) by running the following commands in the project directory:

```
dbt deps
dbt seed
```

### Analytics

Now you're ready to create the analytics by running the following two commands in your terminal:

```
dbt run
dbt run --selector post_processing
```

`dbt run` runs all the data quality metrics in the project. To save time, you can run a selection of metrics if you include a selector argument from [selectors.yml](http://www.google.com/url?sa=D&q=https://docs.getdbt.com/reference/node-selection/yaml-selectors). For example, to run only the Encounter metrics, use `dbt run --selector resource_encounter`.

`dbt run --selector post_processing` runs models that consolidate the metric outputs.

After both of these commands have successfully run, you can inspect the tables and views created in the BigQuery or Spark dataset that you specified within `profiles.yml`. Two key tables created are:

- `metric`: union of all metric outputs at the most granular level
- `metric_definition` metric definitions, one row per metric

A good place to start is querying the `metric_overall` view that joins these two tables together and calculates overall metric values. The output of this view is one row per metric.

Once you have confirmed that metrics are being generated, you will find it helpful to read the [project overview](readme/project_overview.md) to further understand the project structure, and then [extending the project](readme/extending_the_project.md) to learn how to add metrics of your own.


## Support

fhir-dbt-analytics is not an officially supported Google product. The project is work-in-progress so expect additional metrics and other content to be added as well as potentially breaking changes as we refine the project structure.

If you believe that something’s not working, please [create a GitHub issue](http://www.google.com/url?sa=D&q=https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-an-issue).