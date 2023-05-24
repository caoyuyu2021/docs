using PyCall
function fitcnet(
    X,
    y;
    hidden_layer_sizes=(100,),
    activation="relu",
    solver="adam",
    alpha=0.0001,
    batch_size="auto",
    learning_rate="constant",
    learning_rate_init=0.001,
    power_t=0.5,
    max_iter=200,
)
    #创建神经网络
    py"""
    from sklearn.neural_network import MLPClassifier
    def Dummyvar(X, y, hidden_layer_sizes,activation,solver,alpha,batch_size,learning_rate,learning_rate_init,power_t,max_iter):
        clf = MLPClassifier(random_state=1, 
                            max_iter=max_iter,
                            hidden_layer_sizes=hidden_layer_sizes,
                            activation=activation,
                            solver=solver,
                            alpha=alpha,
                            batch_size=batch_size,
                            learning_rate=learning_rate,
                            learning_rate_init=learning_rate_init,
                            power_t=power_t,).fit(X, y)               
        return clf
    """
    return py"Dummyvar"(
        X,
        y,
        hidden_layer_sizes,
        activation,
        solver,
        alpha,
        batch_size,
        learning_rate,
        learning_rate_init,
        power_t,
        max_iter,
    )
end