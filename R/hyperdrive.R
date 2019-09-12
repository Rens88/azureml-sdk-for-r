# Copyright(c) Microsoft Corporation.
# Licensed under the MIT license.

### HyperDrive configuration ###

#' Create configuration for a HyperDrive run
#' @param hyperparameter_sampling hyperparameter sampling option
#' @param primary_metric_name name of primary metric
#' @param primary_metric_goal goal of primary metric
#' @param max_total_runs maximum number of runs to queue
#' @param max_concurrent_runs maximum number of runs to start concurrently
#' @param max_duration_minutes maximum time to allow runs
#' @param policy termination policy
#' @param estimator Estimator object
#' @return HyperDriveConfig object
#' @export
hyperdrive_config <- function(hyperparameter_sampling, primary_metric_name,
                              primary_metric_goal, max_total_runs,
                              max_concurrent_runs = NULL, max_duration_minutes = 10080L,
                              policy = NULL, estimator = NULL)
{
  
  azureml$train$hyperdrive$HyperDriveConfig(hyperparameter_sampling, primary_metric_name,
                                            primary_metric_goal, max_total_runs,
                                            max_concurrent_runs, max_duration_minutes,
                                            policy, estimator)
}

### Specifying metric goal ###

#' Define supported metric goals for hyperparameter tuning
#' @param goal string name of the goal ("MAXIMIZE" or "MINIMIZE")
#' @return PrimaryMetricGoal object
#' @export
primary_metric_goal <- function(goal)
{
  azureml$train$hyperdrive$PrimaryMetricGoal(goal)
}

### Specifying early termination policy ###

#' Create Bandit policy for HyperDrive runs
#' @param slack_factor ratio of the allowed distance from best-performing run
#' @param slack_amount absolute allowed distance from the best-performing run
#' @param evaluation_interval frequency for applying policy
#' @param delay_evaluation how many intervals to delay the first evaluation
#' @return EarlyTerminationPolicy object
#' @export
bandit_policy <- function(slack_factor = NULL, slack_amount = NULL,
                          evaluation_interval = 1L, delay_evaluation = 0L)
{
  azureml$train$hyperdrive$BanditPolicy(evaluation_interval, slack_factor,
                                        slack_amount, delay_evaluation)
}

#' Create Median Stopping policy for HyperDrive runs
#' @param evaluation_interval frequency for applying policy
#' @param delay_evaluation how many intervals to delay the first evaluation
#' @return EarlyTerminationPolicy object
#' @export
median_stopping_policy <- function(evaluation_interval = 1L, delay_evaluation = 0L)
{
  azureml$train$hyperdrive$MedianStoppingPolicy(evaluation_interval, delay_evaluation)
}

#' Create Truncation Selection policy for HyperDrive runs
#' @param truncation_percentage percentage of lowest performing runs to terminate at each interval
#' @param evaluation_interval frequency for applying policy
#' @param delay_evaluation how many intervals to delay the first evaluation
#' @return EarlyTerminationPolicy object
#' @export
truncation_selection_policy <- function(truncation_percentage,
                                        evaluation_interval = 1L, delay_evaluation = 0L)
{
  azureml$train$hyperdrive$TruncationSelectionPolicy(truncation_percentage, evaluation_interval,
                                                     delay_evaluation)
}

### Specifying sampling space ###

#' Define Random Parameter sampling over hyperparameter search space
#' @param parameter_space a named list containing each parameter and its distribution
#' @param properties a named list of additional properties for the algorithm
#' @return HyperParameterSampling object
#' @export
random_parameter_sampling <- function(parameter_space, properties = NULL)
{
  azureml$train$hyperdrive$RandomParameterSampling(parameter_space, properties)
}

#' Define Grid Parameter sampling over hyperparameter search space
#' @param parameter_space a named list containing each parameter and its distribution
#' @return HyperParameterSampling object
#' @export
grid_parameter_sampling <- function(parameter_space)
{
  azureml$train$hyperdrive$GridParameterSampling(parameter_space)
}

#' Define Bayesian Parameter sampling over hyperparameter search space
#' @param parameter_space a named list containing each parameter and its distribution
#' @return HyperParameterSampling object
#' @export
bayesian_parameter_sampling <- function(parameter_space)
{
  azureml$train$hyperdrive$BayesianParameterSampling(parameter_space)
}

### Parameter expressions for describing search space ###

#' Specify a discrete set of options to sample from
#' @param options list of options to choose from 
#' @return the stochastic expression
#' @export
choice <- function(options)
{
  azureml$train$hyperdrive$choice(options)
}

#' Specify a set of random integers in the range [0, upper)
#' @param upper upper bound for the range of integers (exclusive)
#' @return the stochastic expression
#' @export
randint <- function(upper)
{
  azureml$train$hyperdrive$randint(upper)
}

#' Specify a uniform distribution from which samples are taken
#' @param min_value minimum value in the range (inclusive)
#' @param max_value maximum value in the range (inclusive)
#' @return the stochastic expression
#' @export
uniform <- function(min_value, max_value)
{
  azureml$train$hyperdrive$uniform(min_value, max_value)
}

#' Specify a uniform distribution of the form round(uniform(min_value, max_value) / q) * q
#' @param min_value minimum value in the range (inclusive)
#' @param max_value maximum value in the range (inclusive)
#' @param q smoothing factor
#' @return the stochastic expression
#' @export
quniform <- function(min_value, max_value, q)
{
  azureml$train$hyperdrive$quniform(min_value, max_value, q)
}

#' Specify a log uniform distribution
#' @param min_value minimum value in the range will be exp(min_value) (inclusive)
#' @param max_value maximum value in the range will be exp(min_value) (inclusive)
#' @return the stochastic expression
#' @export
loguniform <- function(min_value, max_value)
{
  azureml$train$hyperdrive$loguniform(min_value, max_value)
}

#' Specify a uniform distribution of the form round(exp(uniform(min_value, max_value) / q) * q
#' @param min_value minimum value in the range (inclusive)
#' @param max_value maximum value in the range (inclusive)
#' @param q smoothing factor
#' @return the stochastic expression
#' @export
qloguniform <- function(min_value, max_value, q)
{
  azureml$train$hyperdrive$qloguniform(min_value, max_value, q)
}

#' Specify a real value that is normally-distributed with mean mu and standard deviation sigma
#' @param mu mean of the normal distribution
#' @param sigma standard deviation of the normal distribution
#' @return the stochastic expression
#' @export
normal <- function(mu, sigma)
{
  azureml$train$hyperdrive$normal(mu, sigma)
}

#' Specify a normal distribution of the form round(normal(mu, sigma) / q) * q
#' @param mu mean of the normal distribution
#' @param sigma standard deviation of the normal distribution
#' @param q smoothing factor
#' @return the stochastic expression
#' @export
qnormal <- function(mu, sigma, q)
{
  azureml$train$hyperdrive$qnormal(mu, sigma, q)
}

#' Specify a normal distribution of the form exp(normal(mu, sigma))
#' @param mu mean of the normal distribution
#' @param sigma standard deviation of the normal distribution
#' @return the stochastic expression
#' @export
lognormal <- function(mu, sigma)
{
  azureml$train$hyperdrive$lognormal(mu, sigma)
}

#' Specify a normal distribution of the form round(exp(normal(mu, sigma)) / q) * q
#' @param mu mean of the normal distribution
#' @param sigma standard deviation of the normal distribution
#' @param q smoothing factor
#' @return the stochastic expression
#' @export
qlognormal <- function(mu, sigma, q)
{
  azureml$train$hyperdrive$qlognormal(mu, sigma, q)
}

### Retrieving run metrics ###

#' Return the best performing run amongst all completed runs
#' @param hyperdrive_run HyperDriveRun object
#' @param include_failed whether to include failed runs
#' @param include_canceled whether to include canceled runs
#' @return Run object
#' @export
get_best_run_by_primary_metric <- function(hyperdrive_run, include_failed = TRUE,
                                           include_canceled = TRUE)
{
  hyperdrive_run$get_best_run_by_primary_metric(include_failed, include_canceled)
}

#' Return the child runs sorted in descending order by best primary metric
#' @param hyperdrive_run HyperDriveRun object
#' @param top number of top children to be returned, default value of 0 will return all
#' @param reverse reverse the sorting order
#' @param discard_no_metric whether to include children without the primary metric
#' @return named list of child runs
#' @export
get_child_runs_sorted_by_primary_metric <- function(hyperdrive_run, top = 0L,
                                                    reverse = FALSE, discard_no_metric = FALSE)
{
  hyperdrive_run$get_children_sorted_by_primary_metric(top, reverse, discard_no_metric)
}

#' Return hyperparameters for all child runs
#' @param hyperdrive_run HyperDriveRun object
#' @return named list of hyperparameters grouped by run_id
#' @export
get_child_run_hyperparameters <- function(hyperdrive_run)
{
  hyperdrive_run$get_hyperparameters()
}

#' Return metrics from all child runs
#' @param hyperdrive_run HyperDriveRun object
#' @return name list of metrics grouped by run_id
#' @export
get_child_run_metrics <- function(hyperdrive_run)
{
  hyperdrive_run$get_metrics()
}