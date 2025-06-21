awgn_theta_gen <- function(err_std_1, err_std_2) {
    function (theta) {
        function() { c(cos(theta)+rnorm(1, mean=0, sd=err_std_1),sin(theta)+rnorm(1, mean=0, sd=err_std_2)) }
    }
};

sq_loss <- function(theta, theta_hat) {
    (cos(theta)-cos(theta_hat))^2 + (sin(theta)-sin(theta_hat))^2
};

theta_picker <- function() { runif(1, min=0, max=2*pi) }

this_puzzle <- make_parameter_problem(
    awgn_theta_gen(0.3, 0.6),
    sq_loss,
    grader_prior(theta_picker, n_trials=500),
    n_trials=500
);

this_tester <- make_parameter_case(
    theta_picker, 
    awgn_theta_gen(0.3, 0.6),
    sq_loss
);
