% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/datasets.R
\name{create_tabular_dataset_from_json_lines_files}
\alias{create_tabular_dataset_from_json_lines_files}
\title{Create a TabularDataset to represent tabular data in JSON Lines files (http://jsonlines.org/).}
\usage{
create_tabular_dataset_from_json_lines_files(path, validate = TRUE,
  include_path = FALSE, set_column_types = NULL,
  partition_format = NULL)
}
\arguments{
\item{path}{The path to the source files, which can be single value or list
of http url string or tuple of Datastore and relative path.}

\item{validate}{Boolean to validate if data can be loaded from the returned
dataset. Defaults to True. Validation requires that the data source is
accessible from the current compute.}

\item{include_path}{Boolean to keep path information as column in the dataset.
Defaults to False. This is useful when reading multiple files, and want to
know which file a particular record originated from, or to keep useful
information in file path.}

\item{set_column_types}{A named list to set column data type, where key is
column name and value is data type.}

\item{partition_format}{Specify the partition format in path and create string columns from
format '{x}' and datetime column from format '{x:yyyy/MM/dd/HH/mm/ss}', where 'yyyy', 'MM',
'dd', 'HH', 'mm' and 'ss' are used to extrat year, month, day, hour, minute and second for the datetime
type. The format should start from the postition of first partition key until the end of file path.
For example, given a file path '../USA/2019/01/01/data.csv' and data is partitioned by country and time,
we can define '/{Country}/{PartitionDate:yyyy/MM/dd}/data.csv' to create columns 'Country'
of string type and 'PartitionDate' of datetime type.}
}
\value{
The Tabular Dataset object.
}
\description{
Create a TabularDataset to represent tabular data in JSON Lines files (http://jsonlines.org/).
``from_json_lines_files``` creates a Tabular Dataset object , which defines the operations to
load data from JSON Lines files into tabular representation. For the data to be accessible
by Azure Machine Learning, the JSON Lines files specified by \code{path} must be located in
a Datastore or behind public web urls. Column data types are read from data types saved
in the JSON Lines files. Providing `set_column_types` will override the data type
for the specified columns in the returned Tabular Dataset.
}
