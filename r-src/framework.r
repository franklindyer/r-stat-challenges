# theta_dist    : curried, parametrized family of distributions, as RV generators
# loss_fxn      : the loss function, uncurried
# grader        : function that takes the risk function as input and generates a final grade
# n_trials      : number of trials used for each risk function evaluation
make_parameter_problem <- function(theta_gen, loss_fxn, grader, n_trials=500) {
    risk_fxn <- function(decision_fxn) {
        function(theta) {
            loss_value <- function(k) {
                loss_fxn(theta, decision_fxn(theta_gen(theta)()));
            };
            sum(unlist(lapply(1:n_trials, loss_value))) / n_trials;
        }
    };
    run_test <- function(decision_fxn) {
        grader(risk_fxn(decision_fxn))
    };
    run_test
};

make_parameter_case <- function(theta_picker, theta_gen, loss_fxn) {
    function(decision_fxn) {
        theta <- theta_picker();
        omega <- theta_gen(theta)();
        theta_star <- decision_fxn(omega);
        loss <- loss_fxn(theta, theta_star);
        list(theta, omega, theta_star, loss)
    }
}

grader_prior <- function(theta_prior, n_trials=500) {
    function(risk_fxn_cap) {
        risk_value <- function(k) {
            risk_fxn_cap(theta_prior())
        }
        sum(unlist(lapply(1:n_trials, risk_value))) / n_trials
    }
};

grader_minimax <- function(theta_list) {
    function(risk_fxn_cap) {
        max(unlist(lapply(theta_list, risk_fxn_cap)))
    }
}
